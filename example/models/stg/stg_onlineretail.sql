{{
    config(
        materialized='view'
    )
}}
select
*
from {{ ref('lnd_onlineretail') }}
