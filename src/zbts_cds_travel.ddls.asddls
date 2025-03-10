@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Projection View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZBTS_CDS_TRAVEL as select from /dmo/travel_m
composition[0..*] of ZBTS_CDS_BOOKING as _Booking
association[1] to /DMO/I_Agency as _Agency on $projection.AgencyId = _Agency.AgencyID
association[1] to /DMO/I_Customer as _Customer on $projection.CustomerId = _Customer.CustomerID
association[1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency
association[1..1] to /DMO/I_Overall_Status_VH as _OverAllStatus on $projection.OverallStatus = _OverAllStatus.OverallStatus

{

    key travel_id as TravelId,
 @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Agency',
        entity.element: 'AgencyID'
     }]   
    agency_id as AgencyId,
    @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Customer',
        entity.element: 'CustomerID'
     }]
    customer_id as CustomerId,
    begin_date as BeginDate,
    end_date as EndDate,
    @Semantics.amount.currencyCode : 'CurrencyCode'
    booking_fee as BookingFee,
    @Semantics.amount.currencyCode : 'CurrencyCode'
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    description as Description,
    @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Overall_Status_VH',
        entity.element: 'OverallStatus'
     }]
    overall_status as OverallStatus,
    case overall_status
        when 'A' then 'Approved'
        when 'R' then 'Rejected'
        when 'O' then 'Open'
        when 'X' then 'Cancelled'
        else 'Unknown'
    end as StatusText,
    
    case overall_status
        when 'A' then 0
        when 'R' then 1
        when 'O' then 2
        when 'X' then 2
        else 2
    end as Criticality,
    
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    //Local ETag Field --> Odata Etag
    last_changed_at as LastChangedAt,
    
    _Agency,
    _Customer,
    _Currency,
    _OverAllStatus,
    _Booking
    
   // _association_name // Make association public
}
