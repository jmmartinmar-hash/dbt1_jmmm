

-- =============================================================================
-- stg_sql_server_dbo__order
-- =============================================================================


with source as (
select * from {{ source('sql_server_dbo', 'orders') }}
),
renamed as (
select  ORDER_ID,
        USER_ID,
        ADDRESS_ID,
        PROMO_ID,
        CREATED_AT,
        ESTIMATED_DELIVERY_AT,
        DELIVERED_AT,
        TRACKING_ID,
        SHIPPING_SERVICE,
        SHIPPING_COST,
        ORDER_COST,
        ORDER_TOTAL,
        STATUS
        ,coalesce(_fivetran_deleted, false) as is_deleted
        , _fivetran_synced as date_load
        ,_LOADED_AT
from source
)
select * from renamed