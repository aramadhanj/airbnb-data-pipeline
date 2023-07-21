{% macro get_superhost_desc(host_is_superhost) %}
    CASE 
        WHEN {{host_is_superhost}} = 't' THEN 'Yes'
        WHEN {{host_is_superhost}} = 'f' THEN 'No'
        ELSE IFNULL({{host_is_superhost}}, 'No')
    END 
{% endmacro %}