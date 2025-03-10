@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Processsor'
@Metadata.allowExtensions: true
//@Metadata.ignorePropagatedAnnotations: true
define view entity ZBTS_CDS_BOOKSUPPL_PROCESSOR as projection on ZBTS_CDS_BOOKSUPPL
{
    
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    SupplementId,
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _Booking : redirected to parent ZBTS_CDS_BOOKING_PROCESSOR,
    _Supplement,
    _SupplementText,
    _Travel : redirected to ZBTS_CDS_TRAVEL_PROCESSOR
}
