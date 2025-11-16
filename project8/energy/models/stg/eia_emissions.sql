select
  *
from {{ source('energy_raw', 'eia_emissions') }}

