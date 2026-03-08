@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Order Item'
define view entity ZI_PurchaseOrderI
  as select from yekpo
  association to parent ZR_PurchaseOrderH_TP as _poheader on $projection.Ebeln = _poheader.Ebeln
{
  key ebeln     as Ebeln,
  key ebelp     as Ebelp,
      loekz     as Loekz,
      statu     as Statu,
      aedat     as Aedat,
      matnr     as Matnr,
      ematn     as Ematn,
      bukrs     as Bukrs,
      werks     as Werks,
      lgort     as Lgort,
      bednr     as Bednr,
      matkl     as Matkl,
      infnr     as Infnr,
      idnlf     as Idnlf,
      ktmng     as Ktmng,
      menge     as Menge,
      meins     as Meins,
      netwr     as Netwr,
      brtwr     as Brtwr,
      waers_ref as WaersRef,
      
      _poheader
      
}
