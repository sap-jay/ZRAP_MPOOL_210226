@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Order Header TP Root View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_PurchaseOrderH_TP
  as select from ZI_PurchaseOrderH
  composition [0..*] of ZI_PurchaseOrderI as _poitem
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
      _poitem
}
