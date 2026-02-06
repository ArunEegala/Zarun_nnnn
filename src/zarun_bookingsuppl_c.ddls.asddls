@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumprtion for BookingSupp'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #CONSUMPTION
define view entity ZARUN_BOOKINGSuppl_C
  as projection on ZARUN_BOOKINGSuppl_I
{
  key BooksupplUuid,
      TravelUuid,
      BookingUuid,
      BookingSupplementId,
      SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      LocalLastChangedAt,
      /* Associations */
      _Booking : redirected to parent ZARUN_BOOKING_C,
      _Travel  : redirected to ZARUN_TRAVEL_C
}
