{{ config(materialized='view') }}

select

-- identifier
    cast(id as integer) as listing_id,
    listing_url,
    cast(scrape_id as integer) as scrape_id,
    cast(last_scraped as date) as last_scraped,

-- description about listing
    source,
    name,
    {{ name_listing('name') }} AS listing_name,
    description as listing_description,
    neighborhood_overview,
    picture_url,

-- description about host
    cast(host_id as integer) as host_id,
    host_url,
    host_name,
    cast(host_since as date) as host_since,
    host_location,
    host_about,

-- description about host cont
    host_response_time,
    host_response_rate,
    host_acceptance_rate,
    host_is_superhost,
    {{ get_superhost_desc('host_is_superhost') }} AS is_superhost,
    host_thumbnail_url,
    host_picture_url,
    host_neighbourhood,
    host_listings_count,
    host_total_listings_count,
    host_verifications,
    host_has_profile_pic,
    host_identity_verified,
    neighbourhood,
    neighbourhood_cleansed,
    neighbourhood_group_cleansed,

-- location
    latitude,
    longitude,
    CONCAT(latitude, ',', longitude) AS location,

-- type
    property_type,
    room_type,
    accommodates,
    bathrooms,
    bathrooms_text,
    {{number_bathrooms('bathrooms_text')}} AS number_bathrooms,
    bedrooms as number_bedrooms,
    beds as number_beds,
    amenities as other_facilities,
    price,
    {{get_daily_price('price')}} AS daily_price_usd,

-- stay
    minimum_nights as minimum_nights_stay,
    maximum_nights as maximum_nights_stay,

-- availability
    has_availability,
    {{ get_available_desc('has_availability') }} AS is_available,
    availability_30,
    availability_60,
    availability_90,
    availability_365,

-- review
    number_of_reviews,
    number_of_reviews_ltm,
    number_of_reviews_l30d,

-- rating
    review_scores_rating,
    review_scores_accuracy,
    review_scores_cleanliness,
    review_scores_checkin,
    review_scores_communication,
    review_scores_location,
    review_scores_value

FROM {{source('staging','airbnb_table')}}