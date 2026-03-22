@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZLCYMARA01LC'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZLCR_YMARA01LC
  as select from YMARA01 as Matmas
{
  key matnr as Matnr,
  ersda as Ersda,
  created_at_time as CreatedAtTime,
  ernam as Ernam,
  laeda as Laeda,
  aenam as Aenam,
  vpsta as Vpsta,
  pstat as Pstat,
  lvorm as Lvorm,
  mtart as Mtart,
  mbrsh as Mbrsh,
  matkl as Matkl,
  bismt as Bismt,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  meins as Meins,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  bstme as Bstme,
  zeinr as Zeinr,
  zeiar as Zeiar,
  zeivr as Zeivr,
  zeifo as Zeifo,
  aeszn as Aeszn,
  blatt as Blatt,
  blanz as Blanz,
  ferth as Ferth,
  formt as Formt,
  groes as Groes,
  wrkst as Wrkst,
  normt as Normt,
  labor as Labor,
  ekwsl as Ekwsl,
  @Semantics.quantity.unitOfMeasure: 'Gewei'
  brgew as Brgew,
  @Semantics.quantity.unitOfMeasure: 'Gewei'
  ntgew as Ntgew,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  gewei as Gewei,
  @Semantics.quantity.unitOfMeasure: 'Voleh'
  volum as Volum,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  voleh as Voleh,
  behvo as Behvo,
  raube as Raube,
  tempb as Tempb,
  disst as Disst,
  tragr as Tragr,
  stoff as Stoff,
  spart as Spart,
  kunnr as Kunnr,
  eannr as Eannr,
  @Semantics.quantity.unitOfMeasure: 'Meins'
  wesch as Wesch,
  bwscl as Bwscl,
  saiso as Saiso,
  etiar as Etiar,
  etifo as Etifo,
  entar as Entar,
  ean11 as Ean11,
  numtp as Numtp,
  @Semantics.quantity.unitOfMeasure: 'Meabm'
  laeng as Laeng,
  @Semantics.quantity.unitOfMeasure: 'Meabm'
  breit as Breit,
  @Semantics.quantity.unitOfMeasure: 'Meabm'
  hoehe as Hoehe,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  meabm as Meabm,
  prdha as Prdha,
  aeklk as Aeklk,
  cadkz as Cadkz,
  qmpur as Qmpur,
  @Semantics.quantity.unitOfMeasure: 'Ergei'
  ergew as Ergew,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  ergei as Ergei,
  @Semantics.quantity.unitOfMeasure: 'Ervoe'
  ervol as Ervol,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  ervoe as Ervoe,
  gewto as Gewto,
  volto as Volto,
  vabme as Vabme,
  kzrev as Kzrev,
  kzkfg as Kzkfg,
  xchpf as Xchpf,
  vhart as Vhart,
  fuelg as Fuelg,
  stfak as Stfak,
  magrv as Magrv,
  begru as Begru,
  datab as Datab,
  liqdt as Liqdt,
  saisj as Saisj,
  plgtp as Plgtp,
  mlgut as Mlgut,
  extwg as Extwg,
  satnr as Satnr,
  attyp as Attyp,
  kzkup as Kzkup,
  kznfm as Kznfm,
  pmata as Pmata,
  mstae as Mstae,
  mstav as Mstav,
  mstde as Mstde,
  mstdv as Mstdv,
  taklv as Taklv,
  rbnrm as Rbnrm,
  mhdrz as Mhdrz,
  mhdhb as Mhdhb,
  mhdlp as Mhdlp,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  inhme as Inhme,
  @Semantics.quantity.unitOfMeasure: 'Inhme'
  inhal as Inhal,
  vpreh as Vpreh,
  etiag as Etiag,
  @Semantics.quantity.unitOfMeasure: 'Inhme'
  inhbr as Inhbr,
  cmeth as Cmeth,
  cuobf as Cuobf,
  kzumw as Kzumw,
  kosch as Kosch,
  sprof as Sprof,
  nrfhg as Nrfhg,
  mfrpn as Mfrpn,
  mfrnr as Mfrnr,
  bmatn as Bmatn,
  mprof as Mprof,
  kzwsm as Kzwsm,
  saity as Saity,
  profl as Profl,
  ihivi as Ihivi,
  iloos as Iloos,
  serlv as Serlv,
  kzgvh as Kzgvh,
  xgchp as Xgchp,
  kzeff as Kzeff,
  compl as Compl,
  iprkz as Iprkz,
  rdmhd as Rdmhd,
  przus as Przus,
  mtpos_mara as MtposMara,
  bflme as Bflme,
  matfi as Matfi,
  cmrel as Cmrel,
  bbtyp as Bbtyp,
  sled_bbd as SledBbd,
  gtin_variant as GtinVariant,
  gennr as Gennr,
  rmatp as Rmatp,
  gds_relevant as GdsRelevant,
  weora as Weora,
  hutyp_dflt as HutypDflt,
  pilferable as Pilferable,
  whstc as Whstc,
  whmatgr as Whmatgr,
  hndlcode as Hndlcode,
  hazmat as Hazmat,
  hutyp as Hutyp,
  tare_var as TareVar,
  maxc as Maxc,
  maxc_tol as MaxcTol,
  @Semantics.quantity.unitOfMeasure: 'MaxdimUOM'
  maxl as Maxl,
  @Semantics.quantity.unitOfMeasure: 'MaxdimUOM'
  maxb as Maxb,
  @Semantics.quantity.unitOfMeasure: 'MaxdimUOM'
  maxh as Maxh,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  maxdim_uom as MaxdimUOM,
  herkl as Herkl,
  mfrgr as Mfrgr,
  @Semantics.quantity.unitOfMeasure: 'Qqtimeuom'
  qqtime as Qqtime,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  qqtimeuom as Qqtimeuom,
  qgrp as Qgrp,
  serial as Serial,
  ps_smartform as PsSmartform,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  logunit as Logunit,
  cwqrel as Cwqrel,
  cwqproc as Cwqproc,
  cwqtolgr as Cwqtolgr,
  adprof as Adprof,
  ipmipproduct as Ipmipproduct,
  allow_pmat_igno as AllowPmatIgno,
  medium as Medium,
  commodity as Commodity,
  animal_origin as AnimalOrigin,
  textile_comp_ind as TextileCompInd,
  last_changed_time as LastChangedTime,
  matnr_external as MatnrExternal,
  chml_cmplnc_rlvnce_ind as ChmlCmplncRlvnceInd,
  logistical_mat_category as LogisticalMatCategory,
  sales_material as SalesMaterial,
  identification_tag_type as IdentificationTagType,
  productoid as Productoid,
  sdm_version as SdmVersion,
  sgt_csgr as SgtCsgr,
  sgt_covsa as SgtCovsa,
  sgt_stat as SgtStat,
  sgt_scope as SgtScope,
  sgt_rel as SgtRel,
  anp as Anp,
  psm_code as PsmCode,
  fsh_mg_at1 as FshMgAt1,
  fsh_mg_at2 as FshMgAt2,
  fsh_mg_at3 as FshMgAt3,
  fsh_sealv as FshSealv,
  fsh_seaim as FshSeaim,
  fsh_sc_mid as FshScMid,
  dummy_prd_incl_eew_ps as DummyPrdInclEewPs,
  scm_matid_guid16 as ScmMatidGuid16,
  scm_matid_guid22 as ScmMatidGuid22,
  scm_maturity_dur as ScmMaturityDur,
  scm_shlf_lfe_req_min as ScmShlfLfeReqMin,
  scm_shlf_lfe_req_max as ScmShlfLfeReqMax,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  scm_puom as ScmPuom,
  rmatp_pb as RmatpPb,
  prod_shape as ProdShape,
  mo_profile_id as MoProfileID,
  overhang_tresh as OverhangTresh,
  bridge_tresh as BridgeTresh,
  bridge_max_slope as BridgeMaxSlope,
  @Semantics.quantity.unitOfMeasure: 'HeightNonflatUOM'
  height_nonflat as HeightNonflat,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  height_nonflat_uom as HeightNonflatUOM,
  scm_kitcomp as ScmKitcomp,
  scm_prod_paoopt as ScmProdPaoopt,
  scm_bod_deplvl as ScmBodDeplvl,
  scm_restrict_invbal as ScmRestrictInvbal,
  scm_drp_gl_stock as ScmDrpGlStock,
  scm_excl_expedite as ScmExclExpedite,
  newprod_indi as NewprodIndi,
  prd_startdt as PrdStartdt,
  prd_enddt as PrdEnddt,
  inv_pln_mode as InvPlnMode,
  flagclass as Flagclass,
  /cwm/xcwmat as /cwm/xcwmat,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  /cwm/valum as /cwm/valum,
  /cwm/tolgr as /cwm/tolgr,
  /cwm/tara as /cwm/tara,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  /cwm/tarum as /cwm/tarum,
  /bev1/luleinh as /bev1/luleinh,
  /bev1/luldegrp as /bev1/luldegrp,
  /bev1/nestruccat as /bev1/nestruccat,
  /dsd/sl_toltyp as /dsd/slToltyp,
  /dsd/sv_cnt_grp as /dsd/svCntGrp,
  /dsd/vc_group as /dsd/vcGroup,
  /sapmp/kadu as /sapmp/kadu,
  /sapmp/abmein as /sapmp/abmein,
  /sapmp/kadp as /sapmp/kadp,
  /sapmp/brad as /sapmp/brad,
  /sapmp/spbi as /sapmp/spbi,
  @Semantics.quantity.unitOfMeasure: 'Gewei'
  /sapmp/trad as /sapmp/trad,
  /sapmp/kedu as /sapmp/kedu,
  /sapmp/sptr as /sapmp/sptr,
  /sapmp/fbdk as /sapmp/fbdk,
  /sapmp/fbhk as /sapmp/fbhk,
  /sapmp/rili as /sapmp/rili,
  /sapmp/fbak as /sapmp/fbak,
  /sapmp/aho as /sapmp/aho,
  /sapmp/mifrr as /sapmp/mifrr,
  /vso/r_tilt_ind as /vso/rTiltInd,
  /vso/r_stack_ind as /vso/rStackInd,
  /vso/r_bot_ind as /vso/rBotInd,
  /vso/r_top_ind as /vso/rTopInd,
  /vso/r_stack_no as /vso/rStackNo,
  /vso/r_pal_ind as /vso/rPalInd,
  @Semantics.quantity.unitOfMeasure: 'Meabm'
  /vso/r_pal_ovr_d as /vso/rPalOvrD,
  @Semantics.quantity.unitOfMeasure: 'Meabm'
  /vso/r_pal_ovr_w as /vso/rPalOvrW,
  @Semantics.quantity.unitOfMeasure: 'Meabm'
  /vso/r_pal_b_ht as /vso/rPalBHt,
  @Semantics.quantity.unitOfMeasure: 'Meabm'
  /vso/r_pal_min_h as /vso/rPalMinH,
  @Semantics.quantity.unitOfMeasure: 'Meabm'
  /vso/r_tol_b_ht as /vso/rTolBHt,
  /vso/r_no_p_gvh as /vso/rNoPGvh,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  /vso/r_quan_unit as /vso/rQuanUnit,
  /vso/r_kzgvh_ind as /vso/rKzgvhInd,
  packcode as Packcode,
  dg_pack_status as DgPackStatus,
  @Semantics.quantity.unitOfMeasure: 'SrvDuraUOM'
  srv_dura as SrvDura,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  srv_dura_uom as SrvDuraUOM,
  srv_serwi as SrvSerwi,
  srv_escal as SrvEscal,
  som_cycle as SomCycle,
  som_cycle_rule as SomCycleRule,
  som_tc_schema as SomTcSchema,
  som_ctr_autorenewal as SomCtrAutorenewal,
  mcond as Mcond,
  retdelc as Retdelc,
  loglev_reto as LoglevReto,
  nsnid as Nsnid,
  ovlpn as Ovlpn,
  adspc_spc as AdspcSpc,
  varid as Varid,
  msbookpartno as Msbookpartno,
  dpcbt as Dpcbt,
  xgrdt as Xgrdt,
  imatn as Imatn,
  picnum as Picnum,
  bstat as Bstat,
  color_atinn as ColorAtinn,
  size1_atinn as Size1Atinn,
  size2_atinn as Size2Atinn,
  color as Color,
  size1 as Size1,
  size2 as Size2,
  free_char as FreeChar,
  care_code as CareCode,
  brand_id as BrandID,
  fiber_code1 as FiberCode1,
  fiber_part1 as FiberPart1,
  fiber_code2 as FiberCode2,
  fiber_part2 as FiberPart2,
  fiber_code3 as FiberCode3,
  fiber_part3 as FiberPart3,
  fiber_code4 as FiberCode4,
  fiber_part4 as FiberPart4,
  fiber_code5 as FiberCode5,
  fiber_part5 as FiberPart5,
  fashgrd as Fashgrd,
  created_by as CreatedBy,
  created_at as CreatedAt,
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt
}
