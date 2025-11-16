select
  safe_cast(zip as int64) as zip,
  safe_cast(eiaid as int64) as eiaid,
  cast(utility_name as string) as utility_name,
  cast(state as string) as state,

  case
    when lower(cast(service_type as string)) like '%bundled%' then 'Bundled'
    when lower(cast(service_type as string)) like '%retail%' then 'Retail'
    when lower(cast(service_type as string)) like '%generation%' then 'Generation'
    else cast(service_type as string)
  end as service_type,

  case
    when lower(cast(ownership as string)) like '%investor%' then 'Investor Owned'
    when lower(cast(ownership as string)) like '%municipal%' then 'Municipal'
    when lower(cast(ownership as string)) like '%cooperative%' then 'Cooperative'
    else cast(ownership as string)
  end as ownership,

  safe_cast(comm_rate as float64) as comm_rate,
  safe_cast(ind_rate as float64)  as ind_rate,
  safe_cast(res_rate as float64)  as res_rate,

  current_timestamp() as _load_time,
  'U.S. DOE / OpenEI Utility Rate Database' as _data_source
from {{ source('energy_raw', 'iou_zipcodes') }}

