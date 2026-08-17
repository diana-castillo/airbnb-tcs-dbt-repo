{{
  config(
    materialized = 'view',
    )
}}

with l as (
    select * from {{ ref('dim_listings_cleansed') }}
),
h as (
    select * from {{ ref('dim_hosts_cleansed') }}
)

select 
    h.host_id
    ,h.host_name
    ,COUNT(l.listings_id) AS number_of_listings
    ,ROUND(AVG(l.price), 2) AS avg_price
FROM h
LEFT JOIN l USING (host_id)
GROUP BY ALL
ORDER BY number_of_listings DESC