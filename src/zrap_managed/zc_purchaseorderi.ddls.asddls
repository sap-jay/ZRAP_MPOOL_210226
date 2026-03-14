@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption Projection View'
@Metadata.allowExtensions: true
define view entity ZC_PurchaseOrderI
  as projection on ZI_PurchaseOrderI
{
  key Ebeln,
  key Ebelp,
      Loekz,
      Statu,
      Aedat,
      Matnr,
      Ematn,
      Bukrs,
      Werks,
      Lgort,
      Bednr,
      Matkl,
      Infnr,
      Idnlf,
      Ktmng,
      Menge,
      Meins,
      Netwr,
      Brtwr,
      WaersRef,
      
      _poheader : redirected to parent ZC_PurchaseOrderH
}
