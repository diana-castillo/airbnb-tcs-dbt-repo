with resultset as (
    select * from {{ source('airbnb', 'hosts') }}
)
select
id as HOST_ID,
name as HOST_NAME,
is_superhost,
created_at,
updated_at
from resultset