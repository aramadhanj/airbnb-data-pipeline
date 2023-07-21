{{ config(materialized='table') }}

select
    DISTINCT(host_id) AS host_id,
    host_url,
    host_name,
    host_since,
    host_location,
    host_response_time,
    host_is_superhost,
    host_identity_verified
FROM {{ref('stg_listing')}}