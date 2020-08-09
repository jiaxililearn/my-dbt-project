{% macro test_is_not_null(model, column_name) %}

with validation as (

    select
        {{ column_name }} as test_field

    from {{ model }}

),

validation_errors as (

    select
        test_field

    from validation
    -- if this is true, then even_field is actually odd!
    where test_field is null

)

select count(*)
from validation_errors

{% endmacro %}
