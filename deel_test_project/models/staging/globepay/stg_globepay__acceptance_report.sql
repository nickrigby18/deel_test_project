{{
  config(
    materialized = 'view'
  )
}}

with source as (
  select * from {{ source('globepay', 'acceptance_report') }}
)

, renamed_recasted as (
  select
    external_ref as external_reference_id
    , ref as internal_reference_id
    , source as payment_provider_source
    , state as acceptance_state
    , status
    , amount
    , country as country_code
    , currency as currency_code
    , cvv_provided as is_cvv_provided
    , try_to_timestamp_ntz(date_time) as transaction_at_utc
    , rates as rates_json
  from source
)

select * from renamed_recasted