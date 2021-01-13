{% macro rename_segments(column_name) %}
    CASE
        when {{ column_name }} in ('BUILDING', 'HOUSEHOLD', 'FURNITURE') then 'segment_1'
        else 'segment_2'
    END
{% endmacro %}
