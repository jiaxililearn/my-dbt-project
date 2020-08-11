{% set table_name = ref("lnd_onlineretail") %}
{% set group_by_key_list = ['invoiceno', 'invoicedate', 'customerid', 'country'] %}
{% set sum_key_list = ['unitprice', 'quantity'] %}

{{
    config(
        materialized='table'
    )
}}

with final as (
  SELECT

  {% for key in group_by_key_list %}
  {{ key }},
  {% endfor %}

  {% for key in sum_key_list %}
  sum({{ key }}) AS invoice_{{ key }},
  {% endfor %}

  count(*) AS inovice_record_count

  FROM {{ table_name }}
  GROUP BY
  {% for key in group_by_key_list %}
  {{ key }} {% if not loop.last %},{% endif %}
  {% endfor %}
)
select * from final
