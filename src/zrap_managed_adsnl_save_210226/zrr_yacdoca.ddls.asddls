@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZRYACDOCA'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZRR_YACDOCA
  as select from YACDOCA
{
  key rldnr as Rldnr,
  key rbukrs as Rbukrs,
  key gjahr as Gjahr,
  key belnr as Belnr,
  key docln as Docln,
  blart as Blart,
  budat as Budat,
  bldat as Bldat,
  monat as Monat,
  fiscyearper as Fiscyearper,
  racct as Racct,
  kostl as Kostl,
  prctr as Prctr,
  segment as Segment,
  rbusa as Rbusa,
  kokrs as Kokrs,
  ps_posid as PsPosid,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
  rtcur as Rtcur,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
  rhcur as Rhcur,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
  rkcur as Rkcur,
  @Semantics.amount.currencyCode: 'Rtcur'
  tsl as Tsl,
  @Semantics.amount.currencyCode: 'Rhcur'
  hsl as Hsl,
  @Semantics.amount.currencyCode: 'Rkcur'
  ksl as Ksl,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  runit as Runit,
  @Semantics.quantity.unitOfMeasure: 'Runit'
  msl as Msl,
  ebeln as Ebeln,
  ebelp as Ebelp,
  matnr as Matnr,
  werks as Werks,
  kunnr as Kunnr,
  lifnr as Lifnr,
  usnam as Usnam,
  cpudt as Cpudt,
  cputm as Cputm,
  drcrk as Drcrk,
  created_at as CreatedAt,
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt
}
