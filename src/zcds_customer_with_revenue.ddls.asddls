@AbapCatalog.sqlViewName: 'ZCUSTREV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Ex 9: CDS view with aggregation'
define view ZCDS_CUSTOMER_WITH_REVENUE
  as select from Z_BOOKING_AND_CUSTOMER as c
{
  key c.customid,
      c.name,
      c.street,
      c.postcode,
      c.city,
      c.country,
      sum(c.amount)     as amount @<Semantics.amount.currencyCode: 'currency',
      c.currency,
      avg(c.days_ahead) as days_ahead
}
group by
  c.customid,
  c.name,
  c.street,
  c.postcode,
  c.city,
  c.country,
  c.currency
