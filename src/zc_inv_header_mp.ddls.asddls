@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Invoice Header Projection View'
@Metadata.allowExtensions: true

@UI.headerInfo: {
  typeName:       'Invoice',
  typeNamePlural: 'Invoices',
  title:          { type: #STANDARD, value: 'SapDocNumber' },
  description:    { type: #STANDARD, value: 'VendorId' }
}

define root view entity ZC_INV_HEADER_MP
  provider contract transactional_query
  as projection on ZI_INV_HEADER_MP
{
  key InvoiceUuid,

  VendorId,
  CompanyCode,
  InvoiceDate,
  PostingDate,
  Reference,
  HeaderText,
  PaymentTerms,
  DocumentType,
  FiscalYear,

  @Semantics.amount.currencyCode: 'Currency'
  GrossAmount,

  @Semantics.amount.currencyCode: 'Currency'
  TaxAmount,

  @Semantics.currencyCode: true
  @Consumption.valueHelpDefinition: [{
    entity: { name: 'I_Currency', element: 'Currency' }
  }]
  Currency,

  Status,

  SapDocNumber,
  ErrorCode,
  ErrorMessage,
  RetryCount,
  ManuallyCreated,
  CreatedBy,
  CreatedAt,
  LastChangedBy,
  LastChangedAt,
  LocalLastChangedAt,

  _Items : redirected to composition child ZC_INV_ITEM_MP
}
