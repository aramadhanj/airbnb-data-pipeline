{{ config(materialized='table') }}

select
    listing_id,
    listing_url,
    listing_name,
    listing_description,
    picture_url,
    room_type,
    property_type,
    daily_price_usd,
    minimum_nights_stay,
    maximum_nights_stay,
    review_scores_rating
FROM {{ref('stg_listing')}}