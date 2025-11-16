
  
    

    create or replace table `deep-dispatch-470520-r6`.`dbt_energy_stg_dbt_energy_stg`.`eia_consumption`
      
    
    

    
    OPTIONS()
    as (
      select
  safe_cast(period as int64) as period,
  cast(series_id as string) as series_id,
  cast(series_desc as string) as series_desc,
  cast(state_id as string) as state_id,
  cast(state_desc as string) as state_desc,
  safe_cast(value as numeric) as value,
  case
    when lower(cast(unit as string)) in ('million kilowatthours', 'million kilowatt hours', 'million kwh')
      then 'Million kWh'
    else cast(unit as string)
  end as unit,
  current_timestamp() as _load_time,
  'U.S. EIA SEDS' as _data_source
from `deep-dispatch-470520-r6`.`energy_raw`.`eia_consumption`
    );
  