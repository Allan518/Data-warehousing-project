
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  

with model_count as (
    select count(*) as c from `deep-dispatch-470520-r6`.`dbt_energy_stg_dbt_energy_stg`.`ember_yearly_electricity`
),
raw_count as (
    select count(*) as c from `deep-dispatch-470520-r6`.`energy_raw`.`ember_yearly_electricity`
)
select
    1 as row_count_mismatch
from model_count m
join raw_count r
    on m.c != r.c


  
  
      
    ) dbt_internal_test