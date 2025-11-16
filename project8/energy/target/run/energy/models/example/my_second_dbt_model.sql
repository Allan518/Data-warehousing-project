
  
    

    create or replace table `deep-dispatch-470520-r6`.`energy`.`my_second_dbt_model`
      
    
    

    
    OPTIONS()
    as (
      -- Use the `ref` function to select from other models

select *
from `deep-dispatch-470520-r6`.`energy`.`my_first_dbt_model`
where id = 1
    );
  