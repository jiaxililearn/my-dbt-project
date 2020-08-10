{% macro concat_list(key_list) %}
  {% for f in key_list %}
    {{ f }}::text
    {% if not loop.last %} || '_' ||
    {% endif %}
  {% endfor %}
{% endmacro %}
