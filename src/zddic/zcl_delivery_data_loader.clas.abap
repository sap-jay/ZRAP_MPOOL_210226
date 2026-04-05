CLASS zcl_delivery_data_loader DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_delivery_data_loader IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: lt_header TYPE TABLE OF ylikp,
          lt_item   TYPE TABLE OF ylips.

    " 1. Prepare Header Data (5 Deliveries)
    lt_header = VALUE #(
      ( vbeln = '0080000001' erdat = '20231024' ernam = 'DEVELOPER' vstel = '1000' vkorg = '1000' lfart = 'LF' )
      ( vbeln = '0080000002' erdat = '20231024' ernam = 'DEVELOPER' vstel = '1000' vkorg = '1000' lfart = 'LF' )
      ( vbeln = '0080000003' erdat = '20231025' ernam = 'DEVELOPER' vstel = '2000' vkorg = '2000' lfart = 'LF' )
      ( vbeln = '0080000004' erdat = '20231025' ernam = 'DEVELOPER' vstel = '2000' vkorg = '2000' lfart = 'LF' )
      ( vbeln = '0080000005' erdat = '20231026' ernam = 'DEVELOPER' vstel = '1000' vkorg = '1000' lfart = 'LF' )
    ).

    " 2. Prepare Item Data (Multiple items per delivery)
    lt_item = VALUE #(
      " Delivery 1
      ( vbeln = '0080000001' posnr = '000010' matnr = 'MAT-001' lfimg = '10.000' meins = 'PC' werks = '1000' )
      ( vbeln = '0080000001' posnr = '000020' matnr = 'MAT-002' lfimg = '5.000'  meins = 'PC' werks = '1000' )
      " Delivery 2
      ( vbeln = '0080000002' posnr = '000010' matnr = 'MAT-001' lfimg = '20.000' meins = 'PC' werks = '1000' )
      " Delivery 3
      ( vbeln = '0080000003' posnr = '000010' matnr = 'MAT-003' lfimg = '100.000' meins = 'KG' werks = '2000' )
      ( vbeln = '0080000003' posnr = '000020' matnr = 'MAT-004' lfimg = '15.000'  meins = 'KG' werks = '2000' )
      " Delivery 4
      ( vbeln = '0080000004' posnr = '000010' matnr = 'MAT-001' lfimg = '2.000'   meins = 'PC' werks = '2000' )
      " Delivery 5
      ( vbeln = '0080000005' posnr = '000010' matnr = 'MAT-002' lfimg = '50.000'  meins = 'PC' werks = '1000' )
    ).

    " 3. Insert into Database
    DELETE FROM ylikp. " Optional: Clean table first
    DELETE FROM ylips.

    INSERT ylikp FROM TABLE @lt_header.
    INSERT ylips FROM TABLE @lt_item.

    out->write( 'Dummy data for 5 deliveries inserted successfully.' ).
  ENDMETHOD.

ENDCLASS.

