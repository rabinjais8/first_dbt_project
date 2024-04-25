{{
    config(
        materialized='view'
    )
}}

select o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice- o.ordercostprice as orderprofit,
-- from raw customer
c.customerid,
c.customername,
c.segment,
c.country,
-- from raw product
p.productid,
p.category,
p.productname,
p.subcategory
from {{ ref('raw_orders') }} o
left join {{ ref('raw_customers') }} c
on o.customerid = c.customerid
left join {{ ref('raw_products') }} p
on o.productid = p.productid
