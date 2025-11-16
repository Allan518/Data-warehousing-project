select
  cast(geographic_area as string) as geographic_area,
  safe_cast(estimates_base as int64) as estimates_base,
  safe_cast(pop_2020 as int64) as pop_2020,
  safe_cast(pop_2021 as int64) as pop_2021,
  safe_cast(pop_2022 as int64) as pop_2022,
  safe_cast(pop_2023 as int64) as pop_2023,
  safe_cast(pop_2024 as int64) as pop_2024,
  current_timestamp() as _load_time,
  'U.S. Census Bureau PEP' as _data_source
from {{ source('energy_raw', 'census_population') }}

