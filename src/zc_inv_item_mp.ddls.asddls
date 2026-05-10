@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Invoice Item Projection View'
@Metadata.allowExtensions: true

define view entity ZC_INV_ITEM_MP
  as projection on ZI_INV_ITEM_MP
{
  key ItemUuid,
      InvoiceUuid,
      ItemNo,

      Material,
      PoItem,

      @Semantics.quantity.unitOfMeasure: 'Unit'
      Quantity,
      Unit,

      @Semantics.amount.currencyCode: 'Currency'
      Amount,

      @Semantics.currencyCode: true
      @Consumption.valueHelpDefinition: [{
        entity: { name: 'I_Currency', element: 'Currency' }
      }]
      Currency,

      TaxCode,
      MatchStatus,
      LocalLastChangedAt,
      LastChangedAt,

      _Header : redirected to parent ZC_INV_HEADER_MP
}
