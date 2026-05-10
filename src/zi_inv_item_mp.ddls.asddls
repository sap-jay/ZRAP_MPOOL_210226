@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Invoice Item Interface View'
define view entity ZI_INV_ITEM_MP
  as select from zinv_item
  association to parent ZI_INV_HEADER_MP as _Header
    on $projection.InvoiceUuid = _Header.InvoiceUuid
{
  key item_uuid             as ItemUuid,
      invoice_uuid          as InvoiceUuid,
      item_no               as ItemNo,
      material              as Material,
      po_item               as PoItem,

      @Semantics.quantity.unitOfMeasure: 'Unit'
      quantity              as Quantity,
      unit                  as Unit,

      @Semantics.amount.currencyCode: 'Currency'
      amount                as Amount,
      currency              as Currency,

      tax_code              as TaxCode,
      match_status          as MatchStatus,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,

      _Header
}
