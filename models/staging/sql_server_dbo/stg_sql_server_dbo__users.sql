-- =============================================================================
-- stg_sql_server_dbo__users
-- =============================================================================



with source as (
select * from {{ source('sql_server_dbo', 'users') }}
),
renamed as (
select  USER_ID,
        FIRST_NAME,
        LAST_NAME,
        EMAIL,
        PHONE_NUMBER,
        ADDRESS_ID,
        CREATED_AT,
        UPDATED_AT
        ,coalesce(_fivetran_deleted, false) as is_deleted
        , _fivetran_synced as  date_load
        ,_LOADED_AT


from source
)
select * from renamed
