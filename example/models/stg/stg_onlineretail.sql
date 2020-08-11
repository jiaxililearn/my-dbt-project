{% set table_name = ref("lnd_onlineretail") %}
{% set incremental_key = "invoicedate" %}
{{
    config(
        materialized='view'
    )
}}
select
*
from {{ ref('lnd_onlineretail') }}
