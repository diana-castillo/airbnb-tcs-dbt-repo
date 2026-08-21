{{
  config(
    materialized = 'view',
    )
}}

with resultset as (
    select * from {{ ref('dim_listings_cleansed') }}
)

SELECT
listings_id
,listings_name
,minimum_nights
,CASE 
    WHEN minimum_nights >= 7 THEN TRUE
    ELSE FALSE
END AS is_long_term
FROM resultset