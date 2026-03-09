@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Order Header Consumption View'

define root view entity ZC_PurchaseOrderH
  as projection on ZR_PurchaseOrderH_TP
{
  key Ebeln,
      Bukrs,
      Bstyp,
      Bsart,
      Bsakz,
      Loekz,
      Statu,
      Aedat,
      Ernam,
      Pincr,
      Lponr,
      Lifnr,
      Spras,
      Ekorg,
      Ekgrp,
      Waers,
      Wkurs,
      Kufix,
      Bedat,
      Kdatb,
      Kdate,
      Bwbdt,
      Angdt,
      Bnddt,
      Gwldt,
      Ausnr,
      Angnr,
      Ihran,
      Ihrez,
      Verkf,
      Telf1,
      Llief,
      Kunnr,
      
      _poitem : redirected to composition child ZC_PurchaseOrderI
}
