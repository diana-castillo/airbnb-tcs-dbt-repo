{{
  config(
    materialized = 'view',
    )
}}

WITH resultset AS (
  SELECT *
  FROM
    {{ ref('dim_hosts_cleansed') }}
)

SELECT 
host_id
, host_name
from resultset
WHERE is_superhost = 't'