@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZLCYMARA01LC'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZLCC_YMARA01LC
  provider contract TRANSACTIONAL_QUERY
  as projection on ZLCR_YMARA01LC
  association [1..1] to ZLCR_YMARA01LC as _BaseEntity on $projection.MATNR = _BaseEntity.MATNR
{
  key Matnr,
  Ersda,
  CreatedAtTime,
  Ernam,
  Laeda,
  Aenam,
  Vpsta,
  Pstat,
  Lvorm,
  Mtart,
  Mbrsh,
  Matkl,
  Bismt,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  Meins,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  Bstme,
  Zeinr,
  Zeiar,
  Zeivr,
  Zeifo,
  Aeszn,
  Blatt,
  Blanz,
  Ferth,
  Formt,
  Groes,
  Wrkst,
  Normt,
  Labor,
  Ekwsl,
  @Semantics: {
    Quantity.Unitofmeasure: 'Gewei'
  }
  Brgew,
  @Semantics: {
    Quantity.Unitofmeasure: 'Gewei'
  }
  Ntgew,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  Gewei,
  @Semantics: {
    Quantity.Unitofmeasure: 'Voleh'
  }
  Volum,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  Voleh,
  Behvo,
  Raube,
  Tempb,
  Disst,
  Tragr,
  Stoff,
  Spart,
  Kunnr,
  Eannr,
  @Semantics: {
    Quantity.Unitofmeasure: 'Meins'
  }
  Wesch,
  Bwscl,
  Saiso,
  Etiar,
  Etifo,
  Entar,
  Ean11,
  Numtp,
  @Semantics: {
    Quantity.Unitofmeasure: 'Meabm'
  }
  Laeng,
  @Semantics: {
    Quantity.Unitofmeasure: 'Meabm'
  }
  Breit,
  @Semantics: {
    Quantity.Unitofmeasure: 'Meabm'
  }
  Hoehe,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  Meabm,
  Prdha,
  Aeklk,
  Cadkz,
  Qmpur,
  @Semantics: {
    Quantity.Unitofmeasure: 'Ergei'
  }
  Ergew,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  Ergei,
  @Semantics: {
    Quantity.Unitofmeasure: 'Ervoe'
  }
  Ervol,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  Ervoe,
  Gewto,
  Volto,
  Vabme,
  Kzrev,
  Kzkfg,
  Xchpf,
  Vhart,
  Fuelg,
  Stfak,
  Magrv,
  Begru,
  Datab,
  Liqdt,
  Saisj,
  Plgtp,
  Mlgut,
  Extwg,
  Satnr,
  Attyp,
  Kzkup,
  Kznfm,
  Pmata,
  Mstae,
  Mstav,
  Mstde,
  Mstdv,
  Taklv,
  Rbnrm,
  Mhdrz,
  Mhdhb,
  Mhdlp,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  Inhme,
  @Semantics: {
    Quantity.Unitofmeasure: 'Inhme'
  }
  Inhal,
  Vpreh,
  Etiag,
  @Semantics: {
    Quantity.Unitofmeasure: 'Inhme'
  }
  Inhbr,
  Cmeth,
  Cuobf,
  Kzumw,
  Kosch,
  Sprof,
  Nrfhg,
  Mfrpn,
  Mfrnr,
  Bmatn,
  Mprof,
  Kzwsm,
  Saity,
  Profl,
  Ihivi,
  Iloos,
  Serlv,
  Kzgvh,
  Xgchp,
  Kzeff,
  Compl,
  Iprkz,
  Rdmhd,
  Przus,
  MtposMara,
  Bflme,
  Matfi,
  Cmrel,
  Bbtyp,
  SledBbd,
  GtinVariant,
  Gennr,
  Rmatp,
  GdsRelevant,
  Weora,
  HutypDflt,
  Pilferable,
  Whstc,
  Whmatgr,
  Hndlcode,
  Hazmat,
  Hutyp,
  TareVar,
  Maxc,
  MaxcTol,
  @Semantics: {
    Quantity.Unitofmeasure: 'MaxdimUOM'
  }
  Maxl,
  @Semantics: {
    Quantity.Unitofmeasure: 'MaxdimUOM'
  }
  Maxb,
  @Semantics: {
    Quantity.Unitofmeasure: 'MaxdimUOM'
  }
  Maxh,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  MaxdimUOM,
  Herkl,
  Mfrgr,
  @Semantics: {
    Quantity.Unitofmeasure: 'Qqtimeuom'
  }
  Qqtime,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  Qqtimeuom,
  Qgrp,
  Serial,
  PsSmartform,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  Logunit,
  Cwqrel,
  Cwqproc,
  Cwqtolgr,
  Adprof,
  Ipmipproduct,
  AllowPmatIgno,
  Medium,
  Commodity,
  AnimalOrigin,
  TextileCompInd,
  LastChangedTime,
  MatnrExternal,
  ChmlCmplncRlvnceInd,
  LogisticalMatCategory,
  SalesMaterial,
  IdentificationTagType,
  Productoid,
  SdmVersion,
  SgtCsgr,
  SgtCovsa,
  SgtStat,
  SgtScope,
  SgtRel,
  Anp,
  PsmCode,
  FshMgAt1,
  FshMgAt2,
  FshMgAt3,
  FshSealv,
  FshSeaim,
  FshScMid,
  DummyPrdInclEewPs,
  ScmMatidGuid16,
  ScmMatidGuid22,
  ScmMaturityDur,
  ScmShlfLfeReqMin,
  ScmShlfLfeReqMax,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  ScmPuom,
  RmatpPb,
  ProdShape,
  MoProfileID,
  OverhangTresh,
  BridgeTresh,
  BridgeMaxSlope,
  @Semantics: {
    Quantity.Unitofmeasure: 'HeightNonflatUOM'
  }
  HeightNonflat,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  HeightNonflatUOM,
  ScmKitcomp,
  ScmProdPaoopt,
  ScmBodDeplvl,
  ScmRestrictInvbal,
  ScmDrpGlStock,
  ScmExclExpedite,
  NewprodIndi,
  PrdStartdt,
  PrdEnddt,
  InvPlnMode,
  Flagclass,
  /cwm/xcwmat,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  /cwm/valum,
  /cwm/tolgr,
  /cwm/tara,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  /cwm/tarum,
  /bev1/luleinh,
  /bev1/luldegrp,
  /bev1/nestruccat,
  /dsd/slToltyp,
  /dsd/svCntGrp,
  /dsd/vcGroup,
  /sapmp/kadu,
  /sapmp/abmein,
  /sapmp/kadp,
  /sapmp/brad,
  /sapmp/spbi,
  @Semantics: {
    Quantity.Unitofmeasure: 'Gewei'
  }
  /sapmp/trad,
  /sapmp/kedu,
  /sapmp/sptr,
  /sapmp/fbdk,
  /sapmp/fbhk,
  /sapmp/rili,
  /sapmp/fbak,
  /sapmp/aho,
  /sapmp/mifrr,
  /vso/rTiltInd,
  /vso/rStackInd,
  /vso/rBotInd,
  /vso/rTopInd,
  /vso/rStackNo,
  /vso/rPalInd,
  @Semantics: {
    Quantity.Unitofmeasure: 'Meabm'
  }
  /vso/rPalOvrD,
  @Semantics: {
    Quantity.Unitofmeasure: 'Meabm'
  }
  /vso/rPalOvrW,
  @Semantics: {
    Quantity.Unitofmeasure: 'Meabm'
  }
  /vso/rPalBHt,
  @Semantics: {
    Quantity.Unitofmeasure: 'Meabm'
  }
  /vso/rPalMinH,
  @Semantics: {
    Quantity.Unitofmeasure: 'Meabm'
  }
  /vso/rTolBHt,
  /vso/rNoPGvh,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  /vso/rQuanUnit,
  /vso/rKzgvhInd,
  Packcode,
  DgPackStatus,
  @Semantics: {
    Quantity.Unitofmeasure: 'SrvDuraUOM'
  }
  SrvDura,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  SrvDuraUOM,
  SrvSerwi,
  SrvEscal,
  SomCycle,
  SomCycleRule,
  SomTcSchema,
  SomCtrAutorenewal,
  Mcond,
  Retdelc,
  LoglevReto,
  Nsnid,
  Ovlpn,
  AdspcSpc,
  Varid,
  Msbookpartno,
  Dpcbt,
  Xgrdt,
  Imatn,
  Picnum,
  Bstat,
  ColorAtinn,
  Size1Atinn,
  Size2Atinn,
  Color,
  Size1,
  Size2,
  FreeChar,
  CareCode,
  BrandID,
  FiberCode1,
  FiberPart1,
  FiberCode2,
  FiberPart2,
  FiberCode3,
  FiberPart3,
  FiberCode4,
  FiberPart4,
  FiberCode5,
  FiberPart5,
  Fashgrd,
  CreatedBy,
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
