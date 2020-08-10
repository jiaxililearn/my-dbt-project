{% macro parse_timestamp(string, format) %}
to_timestamp(string, format)
{% endmacro %}
