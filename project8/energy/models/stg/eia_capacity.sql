select
  safe_cast(year as int64) as year,
  cast(state_code as string) as state_code,

  case
    when lower(cast(producer_type as string)) = 'total electric power industry' then 'Other'
    when lower(cast(producer_type as string)) like 'electric generators, independent power producers%' then 'IPP'
    when lower(cast(producer_type as string)) like 'electric generators, electric utilities%' then 'Electric Power Utility'
    when lower(cast(producer_type as string)) = 'industrial power' then 'Industrial Power'
    else cast(producer_type as string)
  end as producer_type,

  case
    when lower(cast(fuel_source as string)) in ('solar thermal and photovoltaic', 'solar', 'photovoltaic') then 'Solar'
    when lower(cast(fuel_source as string)) in ('natural gas', 'gas') then 'Gas'
    when lower(cast(fuel_source as string)) in ('wood and wood derived fuels', 'other biomass', 'biomass') then 'Biomass'
    when lower(cast(fuel_source as string)) = 'petroleum' then 'Oil'
    when lower(cast(fuel_source as string)) = 'coal' then 'Coal'
    when lower(cast(fuel_source as string)) = 'all sources' then 'Other'
    else cast(fuel_source as string)
  end as fuel_source,

  safe_cast(nameplate_capacity_mw as numeric) as nameplate_capacity_mw,
  safe_cast(summer_capacity_mw as numeric) as summer_capacity_mw,
  safe_cast(capacity_utilization as float64) as capacity_utilization,

  cast(fuel_group as string) as fuel_group,
  safe_cast(is_renewable as bool) as is_renewable,

  case
    when lower(cast(producer_class as string)) like 'electric generators, independent power producers%' then 'IPP'
    when lower(cast(producer_class as string)) like 'electric generators, electric utilities%' then 'Electric Power Utility'
    when lower(cast(producer_class as string)) = 'total electric power industry' then 'Other'
    else cast(producer_class as string)
  end as producer_class,

  case
    when regexp_contains(lower(cast(capacity_band as string)), r'^micro') then 'micro'
    when regexp_contains(lower(cast(capacity_band as string)), r'^small') then 'small'
    when regexp_contains(lower(cast(capacity_band as string)), r'^medium') then 'medium'
    when regexp_contains(lower(cast(capacity_band as string)), r'^large') then 'large'
    else cast(capacity_band as string)
  end as capacity_band,

  cast(notes as string) as notes,

  current_timestamp() as _load_time,
  'EIA' as _data_source
from {{ source('energy_raw', 'eia_capacity') }}

