CLASS zcl_data_loader DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_data_loader IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lt_yekko TYPE TABLE OF yekko,
          lt_yekpo TYPE TABLE OF yekpo,
          lv_ebeln TYPE ebeln.

    " Loop to create 5 Purchase Orders
    DO 5 TIMES.
      " Generate a dummy PO number (4500000001 to 4500000005)
      lv_ebeln = |45{ sy-index WIDTH = 8 ALIGN = RIGHT PAD = '0' }|.

      " 1. Add Header (YEKKO)
      APPEND VALUE #(
        client   = sy-mandt
        ebeln    = lv_ebeln
        bukrs    = '1000'
        bstyp    = 'F'
        bsart    = 'NB'
        lifnr    = 'VEND_00' && sy-index
        ekorg    = '1000'
        ekgrp    = '001'
        waers    = 'EUR'
        bedat    = sy-datum
        ernam    = sy-uname
      ) TO lt_yekko.

      " 2. Add 2 Items per PO (YEKPO)
      DO 2 TIMES.
        APPEND VALUE #(
          client    = sy-mandt
          ebeln     = lv_ebeln
          ebelp     = |{ sy-index * 10 WIDTH = 5 ALIGN = RIGHT PAD = '0' }| " 00010, 00020
          matnr     = 'MAT_ABC_' && sy-index
          txz01     = 'Dummy Material ' && sy-index
          werks     = '1000'
          menge     = '10.000'
          meins     = 'EA'
          netpr     = '100.00'
          waers_ref = 'EUR'
        ) TO lt_yekpo.
      ENDDO.
    ENDDO.

    " 3. Atomic Database Insertion
    INSERT yekko FROM TABLE @lt_yekko.
    IF sy-subrc = 0.
      INSERT yekpo FROM TABLE @lt_yekpo.

      IF sy-subrc = 0.
        COMMIT WORK.
      ELSE.
        ROLLBACK WORK.
      ENDIF.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
