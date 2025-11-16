{{ config(materialized='table') }}

with population as (
    select *
    from {{ ref('census_population_int') }}
),

capacity as (
    select *
    from {{ ref('eia_capacity_int') }}
),

consumption as (
    select *
    from {{ ref('eia_consumption_int') }}
),

emissions as (
    select *
    from {{ ref('eia_emissions_int') }}
)

select
    pop.state_code,
    pop.pop_2023,
    cap.total_capacity_mw,
    cons.total_consumption_mwh,
    emis.total_emissions_tonnes,
    current_timestamp() as _load_time
from population pop
left join capacity cap using (state_code)
left join consumption cons using (state_code)
left join emissions emis using (state_code);

