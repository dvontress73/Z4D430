@AbapCatalog.sqlViewName: 'ZBOOKCUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Exercise 8: Join of booking and customer views'
define view Z_BOOKING_AND_CUSTOMER
  as select from ZCDS_BOOKING as b
    inner join   z_customer   as c on b.customid = c.id
{
  key b.carrid,
  key b.connid,
  key b.fldate,
  key b.bookid,
      b.customid,
      b.amount,
      b.currency,
      b.days_ahead,
      c.name,
      c.street,
      c.postcode,
      c.city,
      c.country,
      c.discount
}
