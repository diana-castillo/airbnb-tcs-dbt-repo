{{
  config(
    materialized = 'view',
    )
}}

WITH scd_raw_listings AS (
  SELECT * FROM {{ ref('scd_raw_listings') }}
)

SELECT
id
,name
,price
FROM scd_raw_listings 
WHERE DBT_VALID_TO is null