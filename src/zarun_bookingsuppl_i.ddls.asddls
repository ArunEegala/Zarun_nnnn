@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement interface'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZARUN_BOOKINGSuppl_I
  as select from zarun_bksupplem
  association to parent ZARUN_BOOKING_I as _Booking on $projection.BookingUuid = _Booking.BookingUuid
  association [1] to ZARUN_TRAVEL_I as _Travel on $projection.TravelUuid = _Travel.TravelUuid
{
  key booksuppl_uuid        as BooksupplUuid,
      root_uuid             as TravelUuid,
      parent_uuid           as BookingUuid,
      booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      local_last_changed_at as LocalLastChangedAt,
      _Booking,
      _Travel
}
