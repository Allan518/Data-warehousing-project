
    
    

with dbt_test__target as (

  select id as unique_field
  from `deep-dispatch-470520-r6`.`energy`.`my_second_dbt_model`
  where id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


