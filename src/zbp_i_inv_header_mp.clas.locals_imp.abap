*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* temporary variable declarations

"═══════════════════════════════════════════════════════════════════
" LOCAL CLASS DEFINITIONS
"═══════════════════════════════════════════════════════════════════

CLASS lhc_InvHeader DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR InvHeader RESULT result.
    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR InvHeader RESULT result.
    METHODS PostInvoice FOR MODIFY
      IMPORTING keys FOR ACTION InvHeader~PostInvoice RESULT result.
    METHODS ReverseInvoice FOR MODIFY
      IMPORTING keys FOR ACTION InvHeader~ReverseInvoice RESULT result.
    METHODS DeriveDueDate FOR DETERMINE ON MODIFY
      IMPORTING keys FOR InvHeader~DeriveDueDate.
    METHODS DeriveTaxAmount FOR DETERMINE ON MODIFY
      IMPORTING keys FOR InvHeader~DeriveTaxAmount.
    METHODS ValidateAmount FOR VALIDATE ON SAVE
      IMPORTING keys FOR InvHeader~ValidateAmount.
    METHODS ValidateDates FOR VALIDATE ON SAVE
      IMPORTING keys FOR InvHeader~ValidateDates.
    METHODS ValidateItemTotals FOR VALIDATE ON SAVE
      IMPORTING keys FOR InvHeader~ValidateItemTotals.
    METHODS ValidateMandatory FOR VALIDATE ON SAVE
      IMPORTING keys FOR InvHeader~ValidateMandatory.
ENDCLASS.

CLASS lhc_InvItem DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS ValidateItemAmount FOR VALIDATE ON SAVE
      IMPORTING keys FOR InvItem~ValidateItemAmount.
ENDCLASS.

CLASS lsc_ZI_INV_HEADER_MP DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.
    METHODS save_modified    REDEFINITION.
    METHODS cleanup_finalize REDEFINITION.
ENDCLASS.

"═══════════════════════════════════════════════════════════════════
" lhc_InvHeader IMPLEMENTATION
"═══════════════════════════════════════════════════════════════════

CLASS lhc_InvHeader IMPLEMENTATION.

  "────────────────────────────────────────────────────────────────
  " Instance features: Post enabled only for NEW, Reverse for POSTED
  "────────────────────────────────────────────────────────────────
  METHOD get_instance_features.
    READ ENTITIES OF zi_inv_header_mp IN LOCAL MODE
      ENTITY InvHeader FIELDS ( Status )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_inv)
      FAILED DATA(lt_fail).

    result = VALUE #(
      FOR inv IN lt_inv
      ( %tky                   = inv-%tky
        %action-PostInvoice    = COND #( WHEN inv-Status = 'NEW'
                                         THEN if_abap_behv=>fc-o-enabled
                                         ELSE if_abap_behv=>fc-o-disabled )
        %action-ReverseInvoice = COND #( WHEN inv-Status = 'POSTED'
                                         THEN if_abap_behv=>fc-o-enabled
                                         ELSE if_abap_behv=>fc-o-disabled )
      ) ).
  ENDMETHOD.

  "────────────────────────────────────────────────────────────────
  " Global authorizations: grant all for demo purposes
  "────────────────────────────────────────────────────────────────
  METHOD get_global_authorizations.
    IF requested_authorizations-%create = if_abap_behv=>mk-on.
      result-%create = if_abap_behv=>auth-allowed.
    ENDIF.
    IF requested_authorizations-%update = if_abap_behv=>mk-on.
      result-%update = if_abap_behv=>auth-allowed.
    ENDIF.
    IF requested_authorizations-%delete = if_abap_behv=>mk-on.
      result-%delete = if_abap_behv=>auth-allowed.
    ENDIF.
    IF requested_authorizations-%action-PostInvoice = if_abap_behv=>mk-on.
      result-%action-PostInvoice = if_abap_behv=>auth-allowed.
    ENDIF.
    IF requested_authorizations-%action-ReverseInvoice = if_abap_behv=>mk-on.
      result-%action-ReverseInvoice = if_abap_behv=>auth-allowed.
    ENDIF.
  ENDMETHOD.

  "────────────────────────────────────────────────────────────────
  " Action: Post Invoice  (NEW → POSTED)
  "────────────────────────────────────────────────────────────────
  METHOD PostInvoice.
    READ ENTITIES OF zi_inv_header_mp IN LOCAL MODE
      ENTITY InvHeader FIELDS ( Status )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_inv)
      FAILED failed.

    DATA lt_update TYPE TABLE FOR UPDATE zi_inv_header_mp\\InvHeader.

    LOOP AT lt_inv INTO DATA(inv).
      IF inv-Status <> 'NEW'.
        APPEND VALUE #( %tky = inv-%tky ) TO failed-InvHeader.
        APPEND VALUE #( %tky        = inv-%tky
                        %state_area = 'ACTION_POST'
                        %msg        = new_message_with_text(
                                        severity = if_abap_behv_message=>severity-error
                                        text     = 'Only NEW invoices can be posted' ) )
               TO reported-InvHeader.
        CONTINUE.
      ENDIF.
      APPEND VALUE #(
        %tky               = inv-%tky
        Status             = 'POSTED'
        LastChangedBy      = cl_abap_context_info=>get_user_alias( )
        LastChangedAt      = cl_abap_context_info=>get_system_time( )
        LocalLastChangedAt = cl_abap_context_info=>get_system_time( )
      ) TO lt_update.
    ENDLOOP.

    MODIFY ENTITIES OF zi_inv_header_mp IN LOCAL MODE
      ENTITY InvHeader
        UPDATE FIELDS ( Status LastChangedBy LastChangedAt LocalLastChangedAt )
        WITH lt_update
      REPORTED DATA(lt_rep)
      FAILED   DATA(lt_fail_mod).

    READ ENTITIES OF zi_inv_header_mp IN LOCAL MODE
      ENTITY InvHeader ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(lt_result).

    result = VALUE #( FOR r IN lt_result ( %tky = r-%tky  %param = r ) ).
  ENDMETHOD.

  "────────────────────────────────────────────────────────────────
  " Action: Reverse Invoice  (POSTED → REVERSED)
  "────────────────────────────────────────────────────────────────
  METHOD ReverseInvoice.
    READ ENTITIES OF zi_inv_header_mp IN LOCAL MODE
      ENTITY InvHeader FIELDS ( Status )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_inv)
      FAILED failed.

    DATA lt_update TYPE TABLE FOR UPDATE zi_inv_header_mp\\InvHeader.

    LOOP AT lt_inv INTO DATA(inv).
      IF inv-Status <> 'POSTED'.
        APPEND VALUE #( %tky = inv-%tky ) TO failed-InvHeader.
        APPEND VALUE #( %tky        = inv-%tky
                        %state_area = 'ACTION_REVERSE'
                        %msg        = new_message_with_text(
                                        severity = if_abap_behv_message=>severity-error
                                        text     = 'Only POSTED invoices can be reversed' ) )
               TO reported-InvHeader.
        CONTINUE.
      ENDIF.
      APPEND VALUE #(
        %tky               = inv-%tky
        Status             = 'REVERSED'
        LastChangedBy      = cl_abap_context_info=>get_user_alias( )
        LastChangedAt      = cl_abap_context_info=>get_system_time( )
        LocalLastChangedAt = cl_abap_context_info=>get_system_time( )
      ) TO lt_update.
    ENDLOOP.

    MODIFY ENTITIES OF zi_inv_header_mp IN LOCAL MODE
      ENTITY InvHeader
        UPDATE FIELDS ( Status LastChangedBy LastChangedAt LocalLastChangedAt )
        WITH lt_update
      REPORTED DATA(lt_rep)
      FAILED   DATA(lt_fail_mod).

    READ ENTITIES OF zi_inv_header_mp IN LOCAL MODE
      ENTITY InvHeader ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(lt_result).

    result = VALUE #( FOR r IN lt_result ( %tky = r-%tky  %param = r ) ).
  ENDMETHOD.

  "────────────────────────────────────────────────────────────────
  " Determination: Posting Date = Invoice Date + 30 days
  "────────────────────────────────────────────────────────────────
  METHOD DeriveDueDate.
    READ ENTITIES OF zi_inv_header_mp IN LOCAL MODE
      ENTITY InvHeader FIELDS ( InvoiceDate )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_inv).

    DATA lt_update TYPE TABLE FOR UPDATE zi_inv_header_mp\\InvHeader.

    LOOP AT lt_inv INTO DATA(inv) WHERE InvoiceDate IS NOT INITIAL.
      APPEND VALUE #(
        %tky        = inv-%tky
        PostingDate = inv-InvoiceDate + 30
      ) TO lt_update.
    ENDLOOP.

    MODIFY ENTITIES OF zi_inv_header_mp IN LOCAL MODE
      ENTITY InvHeader UPDATE FIELDS ( PostingDate )
        WITH lt_update
      REPORTED DATA(lt_rep)
      FAILED   DATA(lt_fail).
  ENDMETHOD.

  "────────────────────────────────────────────────────────────────
  " Determination: Tax Amount = Gross Amount × 18%
  "────────────────────────────────────────────────────────────────
  METHOD DeriveTaxAmount.
    READ ENTITIES OF zi_inv_header_mp IN LOCAL MODE
      ENTITY InvHeader FIELDS ( GrossAmount )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_inv).

    DATA lt_update TYPE TABLE FOR UPDATE zi_inv_header_mp\\InvHeader.

    LOOP AT lt_inv INTO DATA(inv) WHERE GrossAmount IS NOT INITIAL.
      APPEND VALUE #(
        %tky      = inv-%tky
        TaxAmount = inv-GrossAmount * '0.18'
      ) TO lt_update.
    ENDLOOP.

    MODIFY ENTITIES OF zi_inv_header_mp IN LOCAL MODE
      ENTITY InvHeader UPDATE FIELDS ( TaxAmount )
        WITH lt_update
      REPORTED DATA(lt_rep)
      FAILED   DATA(lt_fail).
  ENDMETHOD.

  "────────────────────────────────────────────────────────────────
  " Validation: All mandatory fields must be filled
  "────────────────────────────────────────────────────────────────
  METHOD ValidateMandatory.
    READ ENTITIES OF zi_inv_header_mp IN LOCAL MODE
      ENTITY InvHeader
        FIELDS ( CompanyCode VendorId InvoiceDate Currency GrossAmount )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_inv)
      FAILED DATA(lt_fail).

    LOOP AT lt_inv INTO DATA(inv).
      IF inv-CompanyCode IS INITIAL.
        APPEND VALUE #( %tky = inv-%tky ) TO failed-InvHeader.
        APPEND VALUE #( %tky        = inv-%tky
                        %state_area = 'VALIDATE_MANDATORY'
                        %msg        = new_message_with_text(
                                        severity = if_abap_behv_message=>severity-error
                                        text     = 'Company Code is mandatory' )
                        %element-CompanyCode = if_abap_behv=>mk-on )
               TO reported-InvHeader.
      ENDIF.
      IF inv-VendorId IS INITIAL.
        APPEND VALUE #( %tky = inv-%tky ) TO failed-InvHeader.
        APPEND VALUE #( %tky        = inv-%tky
                        %state_area = 'VALIDATE_MANDATORY'
                        %msg        = new_message_with_text(
                                        severity = if_abap_behv_message=>severity-error
                                        text     = 'Vendor ID is mandatory' )
                        %element-VendorId = if_abap_behv=>mk-on )
               TO reported-InvHeader.
      ENDIF.
      IF inv-InvoiceDate IS INITIAL.
        APPEND VALUE #( %tky = inv-%tky ) TO failed-InvHeader.
        APPEND VALUE #( %tky        = inv-%tky
                        %state_area = 'VALIDATE_MANDATORY'
                        %msg        = new_message_with_text(
                                        severity = if_abap_behv_message=>severity-error
                                        text     = 'Invoice Date is mandatory' )
                        %element-InvoiceDate = if_abap_behv=>mk-on )
               TO reported-InvHeader.
      ENDIF.
      IF inv-Currency IS INITIAL.
        APPEND VALUE #( %tky = inv-%tky ) TO failed-InvHeader.
        APPEND VALUE #( %tky        = inv-%tky
                        %state_area = 'VALIDATE_MANDATORY'
                        %msg        = new_message_with_text(
                                        severity = if_abap_behv_message=>severity-error
                                        text     = 'Currency is mandatory' )
                        %element-Currency = if_abap_behv=>mk-on )
               TO reported-InvHeader.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  "────────────────────────────────────────────────────────────────
  " Validation: Gross Amount must be greater than zero
  "────────────────────────────────────────────────────────────────
  METHOD ValidateAmount.
    READ ENTITIES OF zi_inv_header_mp IN LOCAL MODE
      ENTITY InvHeader FIELDS ( GrossAmount )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_inv)
      FAILED DATA(lt_fail).

    LOOP AT lt_inv INTO DATA(inv).
      IF inv-GrossAmount <= 0.
        APPEND VALUE #( %tky = inv-%tky ) TO failed-InvHeader.
        APPEND VALUE #( %tky        = inv-%tky
                        %state_area = 'VALIDATE_AMOUNT'
                        %msg        = new_message_with_text(
                                        severity = if_abap_behv_message=>severity-error
                                        text     = 'Gross amount must be greater than zero' )
                        %element-GrossAmount = if_abap_behv=>mk-on )
               TO reported-InvHeader.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  "────────────────────────────────────────────────────────────────
  " Validation: Invoice date not in future; Posting >= Invoice
  "────────────────────────────────────────────────────────────────
  METHOD ValidateDates.
    READ ENTITIES OF zi_inv_header_mp IN LOCAL MODE
      ENTITY InvHeader FIELDS ( InvoiceDate PostingDate )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_inv)
      FAILED DATA(lt_fail).

    DATA(lv_today) = cl_abap_context_info=>get_system_date( ).

    LOOP AT lt_inv INTO DATA(inv).
      IF inv-InvoiceDate > lv_today.
        APPEND VALUE #( %tky = inv-%tky ) TO failed-InvHeader.
        APPEND VALUE #( %tky        = inv-%tky
                        %state_area = 'VALIDATE_DATES'
                        %msg        = new_message_with_text(
                                        severity = if_abap_behv_message=>severity-error
                                        text     = 'Invoice date cannot be in the future' )
                        %element-InvoiceDate = if_abap_behv=>mk-on )
               TO reported-InvHeader.
      ENDIF.
      IF inv-PostingDate IS NOT INITIAL
         AND inv-PostingDate < inv-InvoiceDate.
        APPEND VALUE #( %tky = inv-%tky ) TO failed-InvHeader.
        APPEND VALUE #( %tky        = inv-%tky
                        %state_area = 'VALIDATE_DATES'
                        %msg        = new_message_with_text(
                                        severity = if_abap_behv_message=>severity-error
                                        text     = 'Posting date cannot be before invoice date' )
                        %element-PostingDate = if_abap_behv=>mk-on
                        %element-InvoiceDate = if_abap_behv=>mk-on )
               TO reported-InvHeader.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  "────────────────────────────────────────────────────────────────
  " Validation: Sum of item amounts must equal header gross amount
  "────────────────────────────────────────────────────────────────
  METHOD ValidateItemTotals.
    DATA lv_tolerance TYPE decfloat34 VALUE '0.01'.

    READ ENTITIES OF zi_inv_header_mp IN LOCAL MODE
      ENTITY InvHeader FIELDS ( GrossAmount )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_hdr)
      FAILED DATA(lt_fail).

    READ ENTITIES OF zi_inv_header_mp IN LOCAL MODE
      ENTITY InvHeader BY \_Items
        FIELDS ( Amount InvoiceUuid )
        WITH CORRESPONDING #( lt_hdr )
      RESULT DATA(lt_items).

    LOOP AT lt_hdr INTO DATA(hdr).
      DATA(lv_total) = REDUCE decfloat34(
        INIT s = CONV decfloat34( 0 )
        FOR  i IN lt_items WHERE ( InvoiceUuid = hdr-InvoiceUuid )
        NEXT s = s + i-Amount ).

      DATA(lv_diff) = abs( CONV decfloat34( hdr-GrossAmount ) - lv_total ).

      IF lt_items IS NOT INITIAL
         AND lv_total > 0
         AND lv_diff > lv_tolerance.
        APPEND VALUE #( %tky = hdr-%tky ) TO failed-InvHeader.
        APPEND VALUE #( %tky        = hdr-%tky
                        %state_area = 'VALIDATE_ITEM_TOTALS'
                        %msg        = new_message_with_text(
                                        severity = if_abap_behv_message=>severity-error
                                        text     = |Item total { lv_total } does not match gross { hdr-GrossAmount }| )
                        %element-GrossAmount = if_abap_behv=>mk-on )
               TO reported-InvHeader.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

"═══════════════════════════════════════════════════════════════════
" lhc_InvItem IMPLEMENTATION
"═══════════════════════════════════════════════════════════════════

CLASS lhc_InvItem IMPLEMENTATION.

  "────────────────────────────────────────────────────────────────
  " Validation: Item amount must be greater than zero
  "────────────────────────────────────────────────────────────────
  METHOD ValidateItemAmount.
    READ ENTITIES OF zi_inv_header_mp IN LOCAL MODE
      ENTITY InvItem FIELDS ( Amount )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_items)
      FAILED DATA(lt_fail).

    LOOP AT lt_items INTO DATA(item).
      IF item-Amount <= 0.
        APPEND VALUE #( %tky = item-%tky ) TO failed-InvItem.
        APPEND VALUE #( %tky        = item-%tky
                        %state_area = 'VALIDATE_ITEM_AMT'
                        %msg        = new_message_with_text(
                                        severity = if_abap_behv_message=>severity-error
                                        text     = 'Item amount must be greater than zero' )
                        %element-Amount = if_abap_behv=>mk-on )
               TO reported-InvItem.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

"═══════════════════════════════════════════════════════════════════
" lsc_ZI_INV_HEADER_MP  –  Additional Save (status audit log)
"═══════════════════════════════════════════════════════════════════

CLASS lsc_ZI_INV_HEADER_MP IMPLEMENTATION.

  "────────────────────────────────────────────────────────────────
  " Write a ZINV_STATUS_LOG row for every status-changing operation
  "────────────────────────────────────────────────────────────────
  METHOD save_modified.
    DATA lt_log TYPE STANDARD TABLE OF zinv_status_log WITH DEFAULT KEY.
    DATA lv_ts  TYPE timestampl.
    GET TIME STAMP FIELD lv_ts.

    " On CREATE: log initial NEW status
    IF create-InvHeader IS NOT INITIAL.
      LOOP AT create-InvHeader INTO DATA(new_hdr).
        APPEND VALUE #(
          client       = sy-mandt
          invoice_uuid = new_hdr-InvoiceUuid
          log_ts       = lv_ts
          old_status   = ''
          new_status   = 'NEW'
          changed_by   = cl_abap_context_info=>get_user_alias( )
          action_text  = 'Invoice created'
        ) TO lt_log.
        lv_ts = lv_ts + '0.000001'.
      ENDLOOP.
    ENDIF.

    " On UPDATE: log only rows where Status actually changed
    IF update-InvHeader IS NOT INITIAL.
      LOOP AT update-InvHeader INTO DATA(upd_hdr)
        WHERE %control-Status = if_abap_behv=>mk-on.

        " Read the pre-LUW status directly from DB
        SELECT SINGLE status FROM zinv_header
          WHERE invoice_uuid = @upd_hdr-InvoiceUuid
          INTO @DATA(lv_old_status).

        APPEND VALUE #(
          client       = sy-mandt
          invoice_uuid = upd_hdr-InvoiceUuid
          log_ts       = lv_ts
          old_status   = lv_old_status
          new_status   = upd_hdr-Status
          changed_by   = cl_abap_context_info=>get_user_alias( )
          action_text  = SWITCH #( upd_hdr-Status
                           WHEN 'POSTED'   THEN 'Invoice posted'
                           WHEN 'REVERSED' THEN 'Invoice reversed'
                           ELSE                 |Status changed to { upd_hdr-Status }| )
        ) TO lt_log.
        lv_ts = lv_ts + '0.000001'.
      ENDLOOP.
    ENDIF.

    IF lt_log IS NOT INITIAL.
      INSERT zinv_status_log FROM TABLE @lt_log.
    ENDIF.
  ENDMETHOD.

  METHOD cleanup_finalize.
    " Nothing to clean up
  ENDMETHOD.

ENDCLASS.
