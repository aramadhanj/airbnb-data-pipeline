{{ config(materialized='table') }}

select
    accommodates,
    bathrooms,
    number_bathrooms,
    number_bedrooms,
    number_beds,
    other_facilities
FROM {{ref('stg_listing')}}