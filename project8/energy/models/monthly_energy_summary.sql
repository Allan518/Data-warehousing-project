{{ config(materialized='table') }}

with consumption as (
    select *
    from {{ ref('eia_consumption_int') }}
),

capacity as (
    select *
    from {{ ref('eia_capacity_int') }}
)

select
    cons.state_id as state,
    cons.period as year_month,
    cons.value as consumption_mwh,
    cap.summer_capacity_mw,
    cap.nameplate_capacity_mw,
    current_timestamp() as _load_time
from consumption cons
left join capacity cap
    on cons.state_id = cap.state_code;

