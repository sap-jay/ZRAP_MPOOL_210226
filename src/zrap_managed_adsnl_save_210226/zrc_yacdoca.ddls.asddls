@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZRYACDOCA'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZRC_YACDOCA
  provider contract TRANSACTIONAL_QUERY
  as projection on ZRR_YACDOCA
  association [1..1] to ZRR_YACDOCA as _BaseEntity on $projection.RLDNR = _BaseEntity.RLDNR and $projection.RBUKRS = _BaseEntity.RBUKRS and $projection.GJAHR = _BaseEntity.GJAHR and $projection.BELNR = _BaseEntity.BELNR and $projection.DOCLN = _BaseEntity.DOCLN
{
  key Rldnr,
  key Rbukrs,
  key Gjahr,
  key Belnr,
  key Docln,
  Blart,
  Budat,
  Bldat,
  Monat,
  Fiscyearper,
  Racct,
  Kostl,
  Prctr,
  Segment,
  Rbusa,
  Kokrs,
  PsPosid,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'Currency', 
      Entity.Name: 'I_CurrencyStdVH', 
      Useforvalidation: true
    } ]
  }
  Rtcur,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'Currency', 
      Entity.Name: 'I_CurrencyStdVH', 
      Useforvalidation: true
    } ]
  }
  Rhcur,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'Currency', 
      Entity.Name: 'I_CurrencyStdVH', 
      Useforvalidation: true
    } ]
  }
  Rkcur,
  @Semantics: {
    Amount.Currencycode: 'Rtcur'
  }
  Tsl,
  @Semantics: {
    Amount.Currencycode: 'Rhcur'
  }
  Hsl,
  @Semantics: {
    Amount.Currencycode: 'Rkcur'
  }
  Ksl,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  Runit,
  @Semantics: {
    Quantity.Unitofmeasure: 'Runit'
  }
  Msl,
  Ebeln,
  Ebelp,
  Matnr,
  Werks,
  Kunnr,
  Lifnr,
  Usnam,
  Cpudt,
  Cputm,
  Drcrk,
  CreatedAt,
  LastChangedBy,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  _BaseEntity
}
