
  
    

    create or replace table `deep-dispatch-470520-r6`.`dbt_energy_stg_dbt_energy_stg`.`eia_emissions`
      
    
    

    
    OPTIONS()
    as (
      select
  *
from `deep-dispatch-470520-r6`.`energy_raw`.`eia_emissions`
    );
  