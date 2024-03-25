<!-- stg_globepay__acceptance_report table and column field descriptions -->
{% docs stg_globepay__acceptance_report %}

This model is sourced from the Globepay Acceptance Report API. It tracks funds loaded into customer Deel accounts via customer debit and credit cards. It contains transaction info including the state whether it was declined or accepted, amount, country, currency, and currency conversion data.

{% enddocs %}

{% docs stg_globepay__acceptance_report_external_reference_id %}
The external transaction ID, unique to each transaction
{% enddocs %}

{% docs stg_globepay__acceptance_report_internal_reference_id %}
The internal transaction ID, unique to each transaction
{% enddocs %}

{% docs stg_globepay__acceptance_report_payment_provider_source %}
The source company from which the payment transaction came
{% enddocs %}

{% docs stg_globepay__acceptance_report_acceptance_state %}
Indicates if the transacation was 'ACCEPTED' or 'DECLINED'
{% enddocs %}

{% docs stg_globepay__acceptance_report_status %}
Indicates if a transaction took place regardless if it was 'ACCEPTED' or 'DECLINED'
{% enddocs %}

{% docs stg_globepay__acceptance_report_amount %}
Amount (USD) that was charged to the customer
{% enddocs %}

{% docs stg_globepay__acceptance_report_country_code %}
2-digit ISO country code where the customer transaction took place
{% enddocs %}

{% docs stg_globepay__acceptance_report_currency_code %}
3-digit ISO currency code relevant to the customer
{% enddocs %}

{% docs stg_globepay__acceptance_report_is_cvv_provided %}
Flag indicating if the CVV was provided at time of transaction
{% enddocs %}

{% docs stg_globepay__acceptance_report_transaction_at_utc %}
Date and time (UTC) when the transaction was recorded
{% enddocs %}

{% docs stg_globepay__acceptance_report_rates_json %}
JSON object field which contains currency conversion rates at the date and time the currency occurred
{% enddocs %}


<!-- stg_globepay__acceptance_report table and column field descriptions -->
{% docs stg_globepay__chargeback_report %}

This model is sourced from the Globepay Chargeback Report API. It tracks whether or not a chargeback took place on the transaction level. This view is 1:1 with stg_globepay__acceptance_report_rates

{% enddocs %}

{% docs stg_globepay__chargeback_report_external_reference_id %}
The external transaction ID, unique to each transaction
{% enddocs %}

{% docs stg_globepay__chargeback_report_status %}
Indicates if a transaction took place regardless if it was 'ACCEPTED' or 'DECLINED'
{% enddocs %}

{% docs stg_globepay__chargeback_report_payment_provider_source %}
The source company from which the payment transaction came
{% enddocs %}

{% docs stg_globepay__chargeback_report_has_transaction_chargeback %}
Flag indicating if the customer petitioned a chargeback for the transaction
{% enddocs %}
