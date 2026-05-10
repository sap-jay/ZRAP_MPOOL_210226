@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Invoice Header Interface View'
define root view entity ZI_INV_HEADER_MP
  as select from zinv_header
  composition [0..*] of ZI_INV_ITEM_MP as _Items
{
  key invoice_uuid          as InvoiceUuid,
      vendor_id             as VendorId,
      company_code          as CompanyCode,
      invoice_date          as InvoiceDate,
      posting_date          as PostingDate,
      reference             as Reference,
      currency              as Currency,

      @Semantics.amount.currencyCode: 'Currency'
      gross_amount          as GrossAmount,

      @Semantics.amount.currencyCode: 'Currency'
      tax_amount            as TaxAmount,

      payment_terms         as PaymentTerms,
      document_type         as DocumentType,
      header_text           as HeaderText,
      status                as Status,
      sap_doc_number        as SapDocNumber,
      fiscal_year           as FiscalYear,
      error_code            as ErrorCode,
      error_message         as ErrorMessage,
      retry_count           as RetryCount,
      manually_created      as ManuallyCreated,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      _Items
}
