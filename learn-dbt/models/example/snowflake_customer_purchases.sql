with sample_customer as (
     select *
    from {{ source('sample', 'customer')}}
),
sample_orders as (
    select *
    from {{ source('sample', 'orders')}}
)


select
    c.c_custkey,
    c.c_name,
    c.c_nationkey as nation,
    sum(o.o_totalprice) as total_order_price
from sample_customer c
         left join sample_orders o
                   on c.C_CUSTKEY = o.O_CUSTKEY
{{group_by(3)}}


-- select
--     c.c_custkey,
--     c.c_name,
--     c.c_nationkey as nation,
--     sum(o.o_totalprice) as total_order_price
-- from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."CUSTOMER" c
--          left join "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS" o
--                    on c.C_CUSTKEY = o.O_CUSTKEY
-- group by
--     c.c_custkey,
--     c.c_name,
--     c.c_nationkey
