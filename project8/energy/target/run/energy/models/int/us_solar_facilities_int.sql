
  
    

    create or replace table `deep-dispatch-470520-r6`.`dbt_energy_stg_dbt_energy_int`.`us_solar_facilities_int`
      
    
    

    
    OPTIONS()
    as (
      select
    *
from `deep-dispatch-470520-r6`.`dbt_energy_stg_dbt_energy_stg`.`us_solar_facilities`
    );
  