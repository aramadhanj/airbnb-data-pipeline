{% macro number_bathrooms(bathrooms_text) %}
    LEFT({{bathrooms_text}}, 1)
{% endmacro %}