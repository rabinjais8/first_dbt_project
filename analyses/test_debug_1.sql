select
        shipmode as value_field,
        count(*) as n_records

    from analytics.dbt_rjaiswal.raw_orders
    group by shipmode