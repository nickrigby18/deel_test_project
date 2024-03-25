{{
  config(
    materialized = 'view'
  )
}}

with source as (
  select * from {{ source('globepay', 'chargeback_report') }}
)

, renamed_recasted as (
  select
    external_ref as external_reference_id
    , status
    , source as payment_provider_source
    , chargeback as has_transaction_chargeback
  from source
)

select * from renamed_recasted