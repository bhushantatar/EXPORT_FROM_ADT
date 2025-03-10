@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Processsor'
@Metadata.allowExtensions: true
//@Metadata.ignorePropagatedAnnotations: true
define view entity ZBTS_CDS_BOOKING_PROCESSOR as projection on ZBTS_CDS_BOOKING
{
    
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _BookingSupplement : redirected to composition child ZBTS_CDS_BOOKSUPPL_PROCESSOR,
    _Carrier,
    _Connection,
    _Customer,
    _BookingStatus,
    _Travel : redirected to parent ZBTS_CDS_TRAVEL_PROCESSOR
     
}
