<!-- fct_customer_payments table and column field descriptions -->
{% docs fct_customer_payments %}

This model combines the 'Accepted' and 'Chargeback' reports sourced by payment processors (eg. Globepay).  This model provides analytic insights into customer transactional data being the primary source for all transaction reporting.

{% enddocs %}

{% docs fct_customer_payments_is_missing_chargeback %}
Flags if chargeback data is missing
{% enddocs %}