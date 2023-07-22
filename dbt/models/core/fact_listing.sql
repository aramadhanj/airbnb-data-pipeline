{{ config(materialized='table') }}

select
    listing_id,
    listing_name,
    listing_url,
    property_type,
    host_id,
    location,
    number_bathrooms,
    number_bedrooms,
    daily_price_usd,
    review_scores_rating
FROM {{ref('stg_listing')}}
WHERE daily_price_usd != 1000000