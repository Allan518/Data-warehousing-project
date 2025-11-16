
  
    

    create or replace table `deep-dispatch-470520-r6`.`dbt_energy_stg_dbt_energy_stg`.`us_solar_facilities`
      
    
    

    
    OPTIONS()
    as (
      select
  safe_cast(case_id as int64) as case_id,
  cast(multi_poly as string) as multi_poly,
  safe_cast(eia_id as int64) as eia_id,
  cast(p_state as string) as state,
  cast(p_county as string) as county,
  safe_cast(ylat as float64) as latitude,
  safe_cast(xlong as float64) as longitude,
  safe_cast(p_area as float64) as area_sq_m,
  cast(p_img_date as string) as image_date,
  safe_cast(p_dig_conf as int64) as digitizing_confidence,
  cast(p_name as string) as facility_name,
  safe_cast(p_year as int64) as commissioning_year,
  cast(p_pwr_reg as string) as power_region,
  cast(p_tech_pri as string) as primary_tech,
  cast(p_tech_sec as string) as secondary_tech,
  cast(p_sys_type as string) as system_type,
  cast(p_axis as string) as axis,
  safe_cast(p_azimuth as float64) as azimuth_deg,
  safe_cast(p_tilt as float64) as tilt_deg,
  cast(p_battery as string) as battery_info,
  safe_cast(p_cap_ac as float64) as capacity_ac_mw,
  safe_cast(p_cap_dc as float64) as capacity_dc_mw,
  cast(p_type as string) as project_type,
  cast(p_agvolt as string) as agrivoltaic_type,
  cast(p_comm as string) as community_type,
  safe_cast(p_zscore as float64) as zscore,
  current_timestamp() as _load_time,
  'U.S. Geological Survey (USGS)' as _data_source
from `deep-dispatch-470520-r6`.`energy_raw`.`us_solar_facilities`
    );
  