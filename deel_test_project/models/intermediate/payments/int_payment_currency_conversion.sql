{{
  config(
    materialized = 'incremental'
    , unique_key = 'external_reference_id'
    , schema = 'intermediate'
  )
}}

with acceptance_report as (
  select
    external_reference_id
    , currency_code
    , amount
    , transaction_at_utc
    , rates_json
  from {{ ref('stg_globepay__acceptance_report') }}
  where 1=1
  {%- if is_incremental() -%}
    and transaction_at_utc > (select max(transaction_at_utc) from {{ this }})
  {%- endif -%}

)

-- gets local currency rate & amount 
, get_currency_rate as (
  select
    acceptance_report.external_reference_id
    , acceptance_report.currency_code
    , rates.key as conversion_currency_code
    , rates.value as currency_conversion_rate
  from acceptance_report
    , lateral flatten(input => rates_json) as rates

  having currency_code = conversion_currency_code
)

-- select specified values for easier troubleshooting and convert currency
, final as (
  select
    acceptance_report.external_reference_id
    , acceptance_report.currency_code
    , acceptance_report.amount
    , get_currency_rate.currency_conversion_rate
    , {{ currency_conversion(amount, currency_code, currency_conversion_rate) }} as local_amount
    , acceptance_report.transaction_at_utc
  from acceptance_report
  left join get_currency_rate
    on acceptance_report.external_reference_id = get_currency_rate.external_reference_id
)

select * from final