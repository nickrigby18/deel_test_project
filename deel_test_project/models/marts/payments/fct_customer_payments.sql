{{
  config(
    materialized = 'incremental'
    , unique_key = 'external_reference_id'
  )
}}

with acceptance as (
    select * from {{ ref('stg_globepay__acceptance_report') }}
    where 1=1
      {%- if is_incremental() -%}
        and transaction_at_utc > (select max(transaction_at_utc) from {{ this }})
      {%- endif -%}
)

, chargebacks as (
    select * from {{ ref('stg_globepay__chargeback_report') }}
)

, currency_conversion as (
    select * from {{ ref('int_payment_currency_conversion') }}
    where 1=1
      {%- if is_incremental() -%}
        and transaction_at_utc > (select max(transaction_at_utc) from {{ this }})
      {%- endif -%}
)

, final as (
    select
        acceptance.external_reference_id
        , acceptance.internal_reference_id
        , acceptance.payment_provider_source
        , acceptance.acceptance_state
        , acceptance.status
        , acceptance.amount
        , round(currency_conversion.local_amount, 2) as local_amount
        , currency_conversion.currency_conversion_rate
        , acceptance.country_code
        , acceptance.currency_code
        , acceptance.is_cvv_provided
        , chargebacks.has_transaction_chargeback
        , iff(chargebacks.has_transaction_chargeback is null, true, false) as is_missing_chargeback
        , acceptance.transaction_at_utc
    from acceptance
    left join chargebacks
        on acceptance.external_reference_id = chargebacks.external_reference_id
    left join currency_conversion
        on acceptance.external_reference_id = currency_conversion.external_reference_id
)

select * from final