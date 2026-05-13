{{
    config(
        materialized = 'table',
        unique_key = 'order_id'
    )
}}

with

source as (

    select * from {{ source('jaffle_shop', 'orders') }}

),

renamed as (

    select

        ----------  ids
        id as order_id,
        store_id as location_id,
        customer as customer_id,

        ---------- properties
        {{ cents_to_dollars("order_total") }} as order_total,
        {{ cents_to_dollars("tax_paid") }} as tax_paid,

        ---------- timestamps
        ordered_at

    from source

)

select * from renamed