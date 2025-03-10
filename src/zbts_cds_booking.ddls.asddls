@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking CDS Entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZBTS_CDS_BOOKING as select from /dmo/booking_m
composition[0..*] of ZBTS_CDS_BOOKSUPPL as _BookingSupplement
association to parent ZBTS_CDS_TRAVEL as _Travel on $projection.TravelId = _Travel.TravelId 
//every booking must have customer,carrier and connection
association[1..1] to /DMO/I_Customer as _Customer on $projection.CustomerId = _Customer.CustomerID
association[1..1] to /DMO/I_Carrier as _Carrier on $projection.CarrierId = _Carrier.AirlineID
association[1..1] to /DMO/I_Connection as _Connection on $projection.CarrierId = _Connection.AirlineID and
                                                         $projection.ConnectionId = _Connection.ConnectionID 
association[1..1] to /DMO/I_Booking_Status_VH as _BookingStatus on $projection.BookingStatus = _BookingStatus.BookingStatus
{
    key travel_id as TravelId,
    key booking_id as BookingId,
    booking_date as BookingDate,
     @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Customer',
        entity.element: 'CustomerID'
     }]
    customer_id as CustomerId,
    
     @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Carrier',
        entity.element: 'AirlineID'
     }]     
    carrier_id as CarrierId,
    
     @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Connection',
        entity.element: 'ConnectionID',
        additionalBinding: [{ localElement: 'CarrierId'  ,   //if I select AA airline then only connections of AA only should come
                              element: 'AirlineID'
                            }
                           ]
     }]
    connection_id as ConnectionId,
    
    flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    flight_price as FlightPrice,
    currency_code as CurrencyCode,
    @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Booking_Status_VH',
        entity.element: 'BookingStatus'
     }]
    booking_status as BookingStatus,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    
    _Customer,
    _Carrier,
    _Connection,
    _BookingStatus,
    _Travel,
    _BookingSupplement
}
