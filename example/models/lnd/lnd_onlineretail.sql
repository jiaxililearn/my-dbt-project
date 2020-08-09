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
  where {{incremental_key}} > (select max({{incremental_key}}) from {{ this }})

{% endif %}
