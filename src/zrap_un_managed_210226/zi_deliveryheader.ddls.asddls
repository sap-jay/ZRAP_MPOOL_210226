@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Delivery Header Data'
define view entity ZI_DeliveryHeader
  as select from ylikp
  
{
  key vbeln           as Vbeln,
      ernam           as Ernam,
      erzet           as Erzet,
      erdat           as Erdat,
      bzirk           as Bzirk,
      vstel           as Vstel,
      vkorg           as Vkorg,
      lfart           as Lfart,
      autlf           as Autlf,
      kzazu           as Kzazu,
      wadat           as Wadat,
      lddat           as Lddat,
      tddat           as Tddat,
      lfdat           as Lfdat,
      kodat           as Kodat,
      ablad           as Ablad,
      inco1           as Inco1,
      inco2           as Inco2,
      expkz           as Expkz,
      route           as Route,
      vbtyp           as Vbtyp,
      lprio           as Lprio,
      vsbed           as Vsbed,
      btgew           as Btgew,
      ntgew           as Ntgew,
      gewei           as Gewei,
      volum           as Volum,
      voleh           as Voleh,
      anzpk           as Anzpk,
      berot           as Berot,
      aedat           as Aedat,
      bolnr           as Bolnr,
      xabln           as Xabln,
      wadat_ist       as WadatIst,
      created_by      as CreatedBy,
      created_at      as CreatedAt,
      last_changed_by as LastChangedBy,
      last_changed_at as LastChangedAt
}
