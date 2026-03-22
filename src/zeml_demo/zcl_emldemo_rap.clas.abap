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
    All FIELDS
    "FiELDS ( Ebeln Bukrs )
    WITH VALUE #( ( Ebeln = '4500000001' ) )
    "FROM VALUE #( ( Ebeln = '4500000001' ) )
    RESULT DATA(PurchaseOrders).

    "out->write( purchaseorders ).


    READ ENTITIES OF ZR_PurchaseOrderH_TP
    ENTITY ZR_PurchaseOrderH_TP by \_poitem
    All FIELDS
    "FiELDS ( Ebeln Bukrs )
    WITH VALUE #( ( Ebeln = '4500000002' ) )
    "FROM VALUE #( ( Ebeln = '4500000001' ) )
    RESULT DATA(PurchaseOrderItems)
    FAILED Data(failed)
    Reported Data(reported).
    .

    out->write( purchaseorderitems ).
    out->write( failed ).
    out->write( reported ).





  ENDMETHOD.
ENDCLASS.
