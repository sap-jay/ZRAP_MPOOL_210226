@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Universal Journal Entry'
define view entity ZI_UnivJournalEntry
  as select from yacdoca
{
  key rldnr  as Rldnr,
  key rbukrs as Rbukrs,
  key gjahr  as Gjahr,
  key belnr  as Belnr,
  key docln  as Docln,
      blart  as Blart,
      kostl  as Kostl,
      rtcur  as Rtcur,
      tsl    as Tsl,
      werks  as Werks,
      lifnr  as Lifnr,
      drcrk  as drcrk
}
