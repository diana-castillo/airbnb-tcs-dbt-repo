{{
  config(
    materialized = 'view',
    )
}}

WITH resultset AS (
  SELECT
    *
  FROM
    {{ ref('dim_listings_cleansed') }}
)

SELECT 
listings_id
,listings_name
,price 
,CASE
    WHEN price < 100 THEN 'Budget'
    WHEN price < 300 THEN 'Mid-range'
    ELSE 'Premium'
END AS price_category
,{{ nights_category('minimum_nights') }} AS stay_category
FROM resultset