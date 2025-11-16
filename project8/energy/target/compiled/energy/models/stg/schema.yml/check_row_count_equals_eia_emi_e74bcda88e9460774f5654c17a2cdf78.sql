

with model_count as (
    select count(*) as c from `deep-dispatch-470520-r6`.`dbt_energy_stg_dbt_energy_stg`.`eia_emissions`
),
raw_count as (
    select count(*) as c from `deep-dispatch-470520-r6`.`energy_raw`.`eia_emissions`
)
select
    1 as row_count_mismatch
from model_count m
join raw_count r
    on m.c != r.c

