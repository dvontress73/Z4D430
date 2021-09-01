@AbapCatalog.sqlViewName: 'ZS4D430_ANNO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@AbapCatalog.buffering.type: #GENERIC
@AbapCatalog.buffering.numberOfKeyFields: 4
@AbapCatalog.buffering.status: #ACTIVE
@EndUserText.label: 'Ex 5:Use annotations in ddl sources'

define view ZCDS_ANNOTATIONS
  as select from sbook   as b
    inner join   scustom as c on b.customid = c.id
{

  key b.carrid,
  key b.connid,
  key b.fldate,
  key b.bookid,
      b.class,
      @Semantics.amount.currencyCode: 'CURRENCY'
      b.forcuram  as amount,
      @Semantics.currencyCode: true
      b.forcurkey as currency,
      @Semantics.quantity.unitOfMeasure: 'WUNIT'
      b.luggweight,
      @Semantics.unitOfMeasure: true
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
