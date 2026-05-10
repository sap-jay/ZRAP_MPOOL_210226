CLASS lhc_ZR_UnivJournalEntry DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZR_UnivJournalEntry RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR ZR_UnivJournalEntry RESULT result.

    METHODS PostVendorInv FOR MODIFY
      IMPORTING keys FOR ACTION ZR_UnivJournalEntry~PostVendorInv.

    METHODS validateCurrency FOR VALIDATE ON SAVE
      IMPORTING keys FOR ZR_UnivJournalEntry~validateCurrency.
    METHODS calulateAmtInBalCur FOR DETERMINE ON SAVE
      IMPORTING keys FOR ZR_UnivJournalEntry~calulateAmtInBalCur.

ENDCLASS.

CLASS lhc_ZR_UnivJournalEntry IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD PostVendorInv.
  ENDMETHOD.

  METHOD validateCurrency.
  ENDMETHOD.

  METHOD calulateAmtInBalCur.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZR_UNIVJOURNALENTRY DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZR_UNIVJOURNALENTRY IMPLEMENTATION.

  METHOD save_modified.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
