{% macro number_bathrooms(bathrooms_text) %}
    IFNULL(CAST(NULLIF(NULLIF(NULLIF(SPLIT({{bathrooms_text}}, ' ')[SAFE_OFFSET(0)], 'Half-bath'), 'Shared'),'Private') AS NUMERIC), 1)
{% endmacro %}