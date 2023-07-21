
{% macro get_available_desc(has_availability) %}
    CASE 
        WHEN {{has_availability}} = 't' THEN 'Yes'
        WHEN {{has_availability}} = 'f' THEN 'No'
        ELSE IFNULL({{has_availability}}, 'No')
    END 
{% endmacro %}
