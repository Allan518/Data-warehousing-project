select
  cast(area as string) as area,
  cast(iso3_code as string) as iso3_code,
  safe_cast(year as int64) as year,
  cast(area_type as string) as area_type,
  cast(continent as string) as continent,
  cast(ember_region_eu as string) as ember_region_eu,
  safe_cast(oecd as bool) as oecd,
  safe_cast(g20 as bool) as g20,
  safe_cast(g7 as bool) as g7,
  safe_cast(asean as bool) as asean,
  cast(category as string) as category,
  cast(subcategory as string) as subcategory,
  cast(variable as string) as variable,
  cast(unit as string) as unit,
  safe_cast(value as numeric) as value,
  safe_cast(yoy_absolute as float64) as yoy_absolute,
  safe_cast(yoy_pct_change as float64) as yoy_pct_change,
  current_timestamp() as _load_time,
  'Ember' as _data_source
from {{ source('energy_raw', 'ember_yearly_electricity') }}

