@AbapCatalog.sqlViewName: 'ZCUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Exercise 8: Customer CDS view'
define view z_customer
  as select from scustom as c
{
  key c.id,
      concat_with_space(c.form, c.name, 1)            as name,
      c.street,
      c.postcode,
      c.city,
      c.country,
      @EndUserText.label: 'Discount Factor'
      @EndUserText.quickInfo: 'Customer Specific Discount Factor'
      division(cast(c.discount as abap.int4), 100, 2) as discount

}
