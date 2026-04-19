CLASS lbc_DelHead DEFINITION.
  PUBLIC SECTION.

    CLASS-DATA : lf_create TYPE flag,
                 lf_update TYPE flag,
                 lf_delete TYPE flag,
                 lt_likp   TYPE STANDARD TABLE OF ylikp,
                 ls_likp   TYPE ylikp,
                 lt_lips   TYPE STANDARD TABLE OF ylips,
                 ls_lips   TYPE ylips.
ENDCLASS.
CLASS lbc_DelHead IMPLEMENTATION.
ENDCLASS.

CLASS lhc_DelHead DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR DelHead RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR DelHead RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE DelHead.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE DelHead.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE DelHead.

    METHODS read FOR READ
      IMPORTING keys FOR READ DelHead RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK DelHead.

    METHODS rba_Item FOR READ
      IMPORTING keys_rba FOR READ DelHead\_Item FULL result_requested RESULT result LINK association_links.

    METHODS cba_Item FOR MODIFY
      IMPORTING entities_cba FOR CREATE DelHead\_Item.

ENDCLASS.

CLASS lhc_DelHead IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create.
    lbc_DelHead=>lf_create = abap_true.

    DATA ls_likp TYPE ylikp.
    LOOP AT entities INTO DATA(entity).

      "BAPI or a FM Call  in standard scenarios

      ls_likp = VALUE #( vbeln = entity-Vbeln ).
      lbc_DelHead=>ls_likp = ls_likp.
      IF sy-subrc = 0.
        APPEND VALUE #( vbeln = ls_likp-vbeln ) TO mapped-delhead.
      ELSE.
        APPEND VALUE #( vbeln = ls_likp-vbeln ) TO failed-delhead.

        APPEND VALUE #( vbeln = ls_likp-vbeln
                        %msg  = new_message( id     = 'TST1'
                                             number = '001'
                                             v1     = 'Create Delivery In-Progress'
                                             severity = CONV #( 'I' ) ) ) TO reported-delhead.

        APPEND VALUE #( vbeln = ls_likp-vbeln
                        %msg  = new_message( id     = 'TST2'
                                             number = '002'
                                             v1     = 'Create Failed'
                                             severity = CONV #( 'E' ) ) ) TO reported-delhead.


      ENDIF.


    ENDLOOP.

  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.


    TRY.
        DATA(lo_lock) = cl_abap_lock_object_factory=>get_instance( iv_name = 'EYLIKP' ).
      CATCH cx_abap_lock_failure iNTO data(lo_fail).
      data(message) = lo_fail->get_text( ).

    ENDTRY.

    LOOP AT keys ASSIGNING FIELD-SYMBOL(<key>).
      TRY.
          lo_lock->enqueue(
            it_parameter  = VALUE #( (  name = 'vbeln' value = REF #( <key>-Vbeln ) ) )
          ).
        CATCH cx_abap_foreign_lock INTO DATA(lo_flock).
          APPEND VALUE #( vbeln = <key>-vbeln ) TO failed-delhead.

          APPEND VALUE #( vbeln = <key>-vbeln
                             %msg  = new_message( id     = 'LOC'
                                                  number = '003'
                                                  v1     = lo_flock->get_text( )
                                                  v2     = lo_flock->user_name
                                                  severity = CONV #( 'E' ) ) ) TO reported-delhead.
        CATCH cx_abap_lock_failure.
          APPEND VALUE #( vbeln = <key>-vbeln ) TO failed-delhead.

          APPEND VALUE #( vbeln = <key>-vbeln
                             %msg  = new_message( id     = 'LOC'
                                                  number = '004'
                                                  v1     = lo_flock->get_text( )
                                                  v2     = lo_flock->user_name
                                                  severity = CONV #( 'E' ) ) ) TO reported-delhead.

      ENDTRY.

    ENDLOOP.




  ENDMETHOD.

  METHOD rba_Item.
  ENDMETHOD.

  METHOD cba_Item.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_DelLine DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE DelLine.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE DelLine.

    METHODS read FOR READ
      IMPORTING keys FOR READ DelLine RESULT result.

    METHODS rba_Header FOR READ
      IMPORTING keys_rba FOR READ DelLine\_Header FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_DelLine IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Header.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZR_DELIVERYHEADERTP DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZR_DELIVERYHEADERTP IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.


    IF lbc_DelHead=>lf_create = abap_true.
      MODIFY ylikp FROM @lbc_DelHead=>ls_likp.
      IF sy-subrc <> 0.

      ENDIF.
    ENDIF.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
