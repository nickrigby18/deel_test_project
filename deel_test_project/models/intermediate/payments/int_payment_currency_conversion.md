<!-- int_payment_currency_conversion table and column field descriptions -->
{% docs int_payment_currency_conversion %}

This intermediate model serves the purpose of converting USD to local currency for a field used in downstream models called 'local_amount'. This serves the purpose in the event that the customer success team might call the customer to request information regarding a chargeback on a certain transaction.

{% enddocs %}

{% docs int_payment_currency_conversion_currency_conversion_rate %}
Conversion rate, for the USD charge, that was captured at time of transaction
{% enddocs %}

{% docs int_payment_currency_conversion_local_amount %}
Amount (local currency) that was charged to the customer
{% enddocs %}