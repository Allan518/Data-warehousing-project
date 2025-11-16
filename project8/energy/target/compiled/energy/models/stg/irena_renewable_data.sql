select
  cast(location as string) as country,
  case
    when lower(cast(technology as string)) like '%renewable%' then 'Total renewable energy'
    else cast(technology as string)
  end as technology,
  safe_cast(capacity_mw as numeric) as capacity_mw,
  safe_cast(commissioning_year as int64) as commissioning_year,
  cast(_document_key as string) as document_key,
  current_timestamp() as _load_time,
  'IRENA' as _data_source
from `deep-dispatch-470520-r6`.`energy_raw`.`irena_renewable_data`