{{ config(materialized='table') }}

select
    listing_id,
    listing_name,
    listing_url,
    property_type,
    host_id,
    latitude,
    longitude,
    number_bathrooms,
    number_bedrooms,
    daily_price,
    review_scores_rating
FROM {{ref('stg_listing')}}