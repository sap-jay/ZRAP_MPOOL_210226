CLASS zcl_emldemo_rap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_emldemo_rap IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    "Read Operation

    READ ENTITIES OF ZR_PurchaseOrderH_TP
    ENTITY ZR_PurchaseOrderH_TP
    ALL FIELDS
    "FiELDS ( Ebeln Bukrs )
    WITH VALUE #( ( Ebeln = '4500000001' ) )
    "FROM VALUE #( ( Ebeln = '4500000001' ) )
    RESULT DATA(PurchaseOrders).

    "out->write( purchaseorders ).


    READ ENTITIES OF ZR_PurchaseOrderH_TP
    ENTITY ZR_PurchaseOrderH_TP BY \_poitem "Reading Line items via associations
    ALL FIELDS
    "FiELDS ( Ebeln Bukrs )
    WITH VALUE #( ( Ebeln = '4500000002' ) )
    "FROM VALUE #( ( Ebeln = '4500000001' ) )
    RESULT DATA(PurchaseOrderItems)
    FAILED DATA(failed)
    REPORTED DATA(reported).
    .

    "out->write( purchaseorderitems ).

    "Modify Entities

    MODIFY ENTITIES OF ZR_PurchaseOrderH_TP "Behaviour BDEF
    ENTITY poh "Header Entity
    UPDATE
    SET FIELDS WITH VALUE #( ( Ebeln = '4500000001'
                               Kunnr = 'RUS001' ) )
    FAILED failed
    REPORTED reported.

    out->write( failed ).
    out->write( reported ).

    COMMIT ENTITIES
      RESPONSE OF ZR_PurchaseOrderH_TP
    FAILED failed
    REPORTED reported.

    MODIFY ENTITIES OF ZR_PurchaseOrderH_TP "Behaviour BDEF
    ENTITY poh "Header Entity
    CREATE
    SET FIELDS WITH VALUE #( ( %cid  = 'MyContentID02'
                               Ebeln = '4500000003'
                               Bukrs = 1000
                               Bstyp = 'F'
                               Bsart = 'NB'
                               Ekorg = 1000
                               Kunnr = 'RUS001' ) )
    FAILED failed
    REPORTED reported.

    out->write( failed ).
    out->write( reported ).

    COMMIT ENTITIES
      RESPONSE OF ZR_PurchaseOrderH_TP
    FAILED failed
    REPORTED reported.

    MODIFY ENTITIES OF ZR_PurchaseOrderH_TP "Behaviour BDEF
    ENTITY poh "Header Entity
    DeLETE FROM VALUE #( ( Ebeln = '4500000002' ) )
    FAILED failed
    REPORTED reported.

    out->write( failed ).
    out->write( reported ).

    COMMIT ENTITIES
      RESPONSE OF ZR_PurchaseOrderH_TP
    FAILED failed
    REPORTED reported.









  ENDMETHOD.
ENDCLASS.
