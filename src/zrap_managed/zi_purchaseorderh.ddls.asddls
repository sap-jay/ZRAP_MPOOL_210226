@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Order Header'
define view entity ZI_PurchaseOrderH
  as select from yekko
{
  key ebeln as Ebeln,
      bukrs as Bukrs,
      bstyp as Bstyp,
      bsart as Bsart,
      bsakz as Bsakz,
      loekz as Loekz,
      statu as Statu,
      aedat as Aedat,
      ernam as Ernam,
      pincr as Pincr,
      lponr as Lponr,
      lifnr as Lifnr,
      spras as Spras,
      ekorg as Ekorg,
      ekgrp as Ekgrp,
      waers as Waers,
      wkurs as Wkurs,
      kufix as Kufix,
      bedat as Bedat,
      kdatb as Kdatb,
      kdate as Kdate,
      bwbdt as Bwbdt,
      angdt as Angdt,
      bnddt as Bnddt,
      gwldt as Gwldt,
      ausnr as Ausnr,
      angnr as Angnr,
      ihran as Ihran,
      ihrez as Ihrez,
      verkf as Verkf,
      telf1 as Telf1,
      llief as Llief,
      kunnr as Kunnr
}
