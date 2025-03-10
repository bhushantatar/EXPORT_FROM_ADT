@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Processsor'
@Metadata.allowExtensions: true
//@Metadata.ignorePropagatedAnnotations: true
define root view entity ZBTS_CDS_TRAVEL_PROCESSOR as projection on ZBTS_CDS_TRAVEL
{
  key TravelId,
  AgencyId,
  CustomerId,
  BeginDate,
  EndDate,
  BookingFee,
  TotalPrice,
  CurrencyCode,
  Description,
  @ObjectModel.text.element: [ 'StatusText' ]
  OverallStatus,
  CreatedBy,
  CreatedAt,
  LastChangedBy,
  LastChangedAt,
  
  @Semantics.text: true
  StatusText,
  Criticality,
  /* Associations */
  _Agency,
  _Booking : redirected to composition child ZBTS_CDS_BOOKING_PROCESSOR,
  _Currency,
  _Customer,
  _OverAllStatus  
    
}
