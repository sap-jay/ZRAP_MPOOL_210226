@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Delivery Line'
define view entity ZI_DeliveryItem
  as select from ylips
  association to parent ZR_DeliveryHeaderTp as _header on $projection.Vbeln = _header.Vbeln
{
  key vbeln           as Vbeln,
  key posnr           as Posnr,
      pstyv           as Pstyv,
      matnr           as Matnr,
      matkl           as Matkl,
      werks           as Werks,
      lgort           as Lgort,
      charg           as Charg,
      lfimg           as Lfimg,
      meins           as Meins,
      vrkme           as Vrkme,
      ntgew           as Ntgew,
      brgew           as Brgew,
      gewei           as Gewei,
      mbdat           as Mbdat,
      arktx           as Arktx,
      vgbel           as Vgbel,
      vgpos           as Vgpos,
      fkrel           as Fkrel,
      created_by      as CreatedBy,
      created_at      as CreatedAt,
      last_changed_by as LastChangedBy,
      last_changed_at as LastChangedAt,
       _header
}
