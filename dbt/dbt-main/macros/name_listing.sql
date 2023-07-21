{% macro name_listing(name) %}
    (SELECT SPLIT({{ name }}, ' ')[SAFE_OFFSET(0)])
{% endmacro %}