{% macro test_is_count_equal(model, field, to, column_name) %}

with parent as (

    select
        count(*) as cnt

    from {{ to }}

),

child as (

    select
        count(*) as cnt

    from {{ model }}

)

select count(*)
from child
where cnt <> (select cnt from parent)

{% endmacro %}
