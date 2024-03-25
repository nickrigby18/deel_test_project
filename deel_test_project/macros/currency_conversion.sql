-- macro converts currency to provided local currency
-- amount = USD amount
-- local_currency =  3-digit ISO code (eg. 'USD', 'MXN', etc.)
-- currency_conversion_rate = float type currency conversion value (eg. MXN conversion rate = 1.2345)

{% macro currency_conversion(amount, local_currency, currency_conversion_rate) %}
{%- if local_currency == 'USD' -%}
  amount
{%- else -%}
  amount * currency_conversion_rate
{%- endif -%}
{% endmacro %}