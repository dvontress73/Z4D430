@AbapCatalog.sqlViewName: 'ZS4D430FUNC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Ex 7: Built-inFunctions in a CDS View'

define view ZCDS_Functions
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
      end                                            as class,
      @Semantics.amount.currencyCode: 'CURRENCY'
      currency_conversion(
        amount => b.forcuram,
        source_currency    => b.forcurkey,
        round              => 'X',
        target_currency    => cast( 'USD' as abap.cuky),
        exchange_rate_type =>'M',
        exchange_rate_date => b.order_date,
        error_handling     => 'SET_TO_NULL'
        )                                            as amount,
      cast('USD' as abap.cuky)                       as currency,
      //Annotation after element
      //b.forcuram as amount  @<Semantics.amount.currencyCode: 'CURRENCY',
      //Annotation before element
      //@Semantics.currencyCode: true
      //b.forcurkey as currency,
      @Semantics.quantity.unitOfMeasure: 'WUNIT'
      b.luggweight,
      @Semantics.unitOfMeasure: true
      b.wunit,
      b.order_date,
      dats_days_between(b.order_date, b.fldate)      as days_ahead,
      b.agencynum,
      b.counter,
      b.customid,
      // c.name,
      concat_with_space(c.form, c.name, 1)           as fullname,
      c.street,
      c.postcode,
      c.city,
      c.country,
      @EndUserText.label: 'Discount Factor'
      @EndUserText.quickInfo: 'Customer Specific Discount Factor'
      //cast(c.discount as abap.fltp) / 100.0 as discount
      division(cast(c.discount as abap.int4), 100,2) as discount

}
where
  cancelled <> 'X'
