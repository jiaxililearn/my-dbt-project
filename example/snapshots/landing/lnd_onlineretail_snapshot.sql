{% snapshot lnd_onlineretail_snapshot %}
{% set table_name = ref('lnd_onlineretail') %}
{% set unique_key = "invoiceno" %}
{{
    config(
      target_database='dev',
      target_schema='snapshots',
      unique_key=unique_key,
      strategy='check',
      check_cols='all'
    )
}}

select
*
from {{ table_name }}
WHERE

{% endsnapshot %}
