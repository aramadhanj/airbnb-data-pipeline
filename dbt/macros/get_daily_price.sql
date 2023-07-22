{% macro get_daily_price(price) %}
    CAST(REGEXP_REPLACE({{price}}, r'[^\d.]', '') AS NUMERIC)
{% endmacro %}