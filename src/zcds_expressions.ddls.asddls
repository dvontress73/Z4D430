@AbapCatalog.sqlViewName: 'ZS4D430EXPR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
//@AbapCatalog.buffering.type: #GENERIC
//@AbapCatalog.buffering.numberOfKeyFields: 4
//@AbapCatalog.buffering.status: #ACTIVE
@EndUserText.label: 'Ex 6: Expressions'

define view ZCDS_Expressions
  as select from sbook   as b
    inner join   scustom as c on b.customid = c.id
{

  key b.carrid,
  key b.connid,
  key b.fldate,
  key b.bookid,
      case b.class
        when 'Y' then 'Economy'
        when 'C' then 'Business'
        when 'F' then 'First'
        else '???'
      end                                   as class,
      //Annotation after element
      b.forcuram                            as amount @<Semantics.amount.currencyCode: 'CURRENCY',
      //Annotation before element
      @Semantics.currencyCode: true
      b.forcurkey                           as currency,
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
      c.country,
      @EndUserText.label: 'Discount Factor'
      @EndUserText.quickInfo: 'Customer Specific Discount Factor'
      cast(c.discount as abap.fltp) / 100.0 as discount

}
where
  cancelled <> 'X'
