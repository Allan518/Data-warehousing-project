
  
    

    create or replace table `deep-dispatch-470520-r6`.`dbt_energy_stg_dbt_energy_int`.`census_population_int`
      
    
    

    
    OPTIONS()
    as (
      select
    *
from `deep-dispatch-470520-r6`.`dbt_energy_stg_dbt_energy_stg`.`census_population`
    );
  