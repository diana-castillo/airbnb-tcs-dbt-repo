{{
  config(
    materialized = 'view',
    )
}}

with listings as (
    select * from {{ ref('dim_listings_cleansed') }}
), 
room_types as (
    select * from {{ ref('room_type_group') }}
)

SELECT
listings.listings_id
,listings.room_type
,room_types.room_group
FROM listings 
LEFT JOIN room_types USING (room_type)