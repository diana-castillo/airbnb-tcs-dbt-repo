SELECT *
FROM
    {{ ref('dim_listings_cleansed') }}
WHERE price < 0