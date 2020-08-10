{% set table_name = "lnd.onlineretail" %}
{% set incremental_key = "invoicedate" %}

{{
    config(
        materialized='incremental'
    )
}}

select
*
from {{ table_name }}

{% if is_incremental() %}
  -- this filter will only be applied on an incremental run
  where to_timestamp({{incremental_key}}, 'DD/MM/YY HH:MI') > (select max(to_timestamp({{incremental_key}}, 'DD/MM/YY HH:MI')) from {{ this }})

{% endif %}
