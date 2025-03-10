@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZBTS_CDS_BOOKSUPPL as select from /dmo/booksuppl_m
association to parent ZBTS_CDS_BOOKING as _Booking on $projection.BookingId = _Booking.BookingId and
                                                      $projection.TravelId = _Booking.TravelId
association[1..1] to ZBTS_CDS_TRAVEL as _Travel on $projection.TravelId = _Travel.TravelId
association[1..1] to /DMO/I_Supplement as _Supplement on $projection.SupplementId = _Supplement.SupplementID
association[1..*] to /DMO/I_SupplementText as _SupplementText on $projection.SupplementId = _SupplementText.SupplementID
{
    key travel_id as TravelId,
    key booking_id as BookingId,
    key booking_supplement_id as BookingSupplementId,
    supplement_id as SupplementId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    price as Price,
    currency_code as CurrencyCode,
    last_changed_at as LastChangedAt,
   _Travel,
   _Booking,
   _Supplement,
   _SupplementText
}
