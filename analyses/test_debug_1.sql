select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    select
    orderid as unique_field,
    count(*) as n_records
from analytics.dbt_rjaiswal.raw_orders
where orderid is not null
group by orderid
having count(*) > 1)