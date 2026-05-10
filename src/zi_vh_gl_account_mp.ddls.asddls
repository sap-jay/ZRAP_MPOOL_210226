@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VH: GL Account (Demo)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #CUSTOMIZING }
@Search.searchable: true
define view entity ZI_VH_GL_ACCOUNT_MP
  as select distinct from zinv_item
{
@Search.defaultSearchElement: true
  key cast( '0000100000' as abap.char(10) ) as GlAccount,
      cast( 'Expense Account'              as abap.char(50) ) as GlAccountName,
      cast( '1000'                         as abap.char(4)  ) as CompanyCode
}
union all select distinct from zinv_item
{
  key cast( '0000200000' as abap.char(10) ) as GlAccount,
      cast( 'Vendor Payables'              as abap.char(50) ) as GlAccountName,
      cast( '1000'                         as abap.char(4)  ) as CompanyCode
}
union all select distinct from zinv_item
{
  key cast( '0000300000' as abap.char(10) ) as GlAccount,
      cast( 'Tax Receivable'               as abap.char(50) ) as GlAccountName,
      cast( '1000'                         as abap.char(4)  ) as CompanyCode
}
union all select distinct from zinv_item
{
  key cast( '0000400000' as abap.char(10) ) as GlAccount,
      cast( 'Cost of Goods Sold'           as abap.char(50) ) as GlAccountName,
      cast( '2000'                         as abap.char(4)  ) as CompanyCode
}
