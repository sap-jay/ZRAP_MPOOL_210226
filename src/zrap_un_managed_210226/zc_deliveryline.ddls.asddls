@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Delivery Line Projection'
define view entity ZC_DeliveryLine
  as projection on ZI_DELIVERYITEM
{
  key Vbeln,
  key Posnr,
      Pstyv,
      Matnr,
      Matkl,
      Werks,
      Lgort,
      Charg,
      Lfimg,
      Meins,
      Vrkme,
      Ntgew,
      Brgew,
      Gewei,
      Mbdat,
      Arktx,
      Vgbel,
      Vgpos,
      Fkrel,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _header : redirected to parent ZC_DeliveryHeader
}
