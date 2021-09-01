@AbapCatalog.sqlViewName: 'ZCDSSIMPLE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Exercise 3: Define a simple cds view'
define view zcds_simple
  as select from sbook
{
  carrid,
  connid,
  fldate,
  bookid,
  class,
  forcuram,
  forcurkey,
  luggweight,
  wunit,
  order_date,
  agencynum,
  counter,
  customid
}
