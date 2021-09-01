@AbapCatalog.sqlViewName: 'ZS4D430_JOIN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Exercise 4: Define a CDS view that reflect a db view'

define view zcds_join_and_selection
  as select from sbook   as b
    inner join   scustom as c on b.customid = c.id
{

  key b.carrid,
  key b.connid,
  key b.fldate,
  key b.bookid,
      b.class,
      b.forcuram  as amount,
      b.forcurkey as currency,
      b.luggweight,
      b.wunit,
      b.order_date,
      b.agencynum,
      b.counter,
      b.customid,
      c.name,
      c.street,
      c.postcode,
      c.city,
      c.country

}
where
  cancelled <> 'X'
