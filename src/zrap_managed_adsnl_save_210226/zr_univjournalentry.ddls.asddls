@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Universal Journal Entry - Root'
define root view entity ZR_UnivJournalEntry
  as select from ZI_UnivJournalEntry
{
  key Rldnr,
  key Rbukrs,
  key Gjahr,
  key Belnr,
  key Docln,
      Blart,
      Kostl,
      Rtcur,
      Tsl,
      Werks,
      Lifnr,
      drcrk
}
