-- =============================================================================
-- slv_sql_server_dbo__users
-- =============================================================================

with users as (  select * from {{ ref('stg_sql_server_dbo__users') }}
),
cleaned as (
    select
--pendiente mañana