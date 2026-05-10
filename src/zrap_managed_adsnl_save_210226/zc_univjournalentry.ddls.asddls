@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Universal Journal Entry - Consumption'
@Metadata.allowExtensions: true
define root view entity ZC_UnivJournalEntry
  as projection on ZR_UnivJournalEntry
{
  key Rldnr,
  key Rbukrs,
  key Gjahr,
  key Belnr,
  key Docln,
      Blart,
      Kostl,
      @Consumption.valueHelpDefinition: [{ 
         entity: {
           name  : 'I_CurrencyStdVH',
           element : 'Currency'
         }
       }]
      Rtcur,
      Tsl,
      Werks,
      Lifnr,
      drcrk
}
