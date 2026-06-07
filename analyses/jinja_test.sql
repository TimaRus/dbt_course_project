
{%- set source_relation_flights = load_relation( ref("stg_flights__flights") ) %}

{% for column in adapter.get_columns_in_relation(source_relation_flights)%}
    {{ 'Columns: ' ~column -}}
{% endfor %}