{% test check_row_count_equals(model, raw_table) %}

with model_count as (
    select count(*) as c from {{ model }}
),
raw_count as (
    select count(*) as c from {{ raw_table }}
)
select
    1 as row_count_mismatch
from model_count m
join raw_count r
    on m.c != r.c

{% endtest %}

