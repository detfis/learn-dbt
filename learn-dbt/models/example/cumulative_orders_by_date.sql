with orders as (
    select *
    from {{ source('sample', 'orders') }}
)

select DISTINCT
    o_orderdate,
    sum(o_totalprice) over (order by o_orderdate) as cumulative_sales
from orders
order by o_orderdate
