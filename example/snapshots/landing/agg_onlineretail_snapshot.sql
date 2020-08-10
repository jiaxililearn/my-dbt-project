{% snapshot agg_onlineretail_snapshot %}
{% set table_name = ref('agg_onlineretail') %}
{% set unique_key_list = ['invoiceno', 'invoicedate'] %}
{% set unique_key_name = "unique_key" %}
{{
    config(
      target_database='dev',
      target_schema='snapshots',
      unique_key=unique_key_name,
      strategy='check',
      check_cols='all'
    )
}}

with snapshot_table as (
  select
  {{concat_list(unique_key_list)}} AS {{ unique_key_name }},
  *
  from {{ table_name }}
)


select * from snapshot_table

{% endsnapshot %}
