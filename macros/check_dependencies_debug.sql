{% macro check_dependencies_debug(model_name) %}
{% if execute %}

{% do log("DEBUG model_name = " ~ model_name, True) %}

{% set dep_obj = {} %}

{% for node in graph.nodes.values() %}
    {% if node.name == model_name %}

        {% do log("DEBUG found node.name = " ~ node.name, True) %}
        {% do log("DEBUG node.resource_type = " ~ node.resource_type, True) %}
        {% do log("DEBUG node.depends_on = " ~ node.depends_on, True) %}

        {% do dep_obj.update(node.depends_on) %}
    {% endif %}
{% endfor %}

{% do log("DEBUG dep_obj = " ~ dep_obj, True) %}

{% set obj_keys = dep_obj.keys() | list %}

{% do log("DEBUG obj_keys = " ~ obj_keys, True) %}

{% set cnt_in_obj = [] %}

{% for key in obj_keys %}
    {% do log("DEBUG key = " ~ key, True) %}
    {% do log("DEBUG dep_obj[key] = " ~ dep_obj[key], True) %}
    {% do log("DEBUG dep_obj[key] length = " ~ (dep_obj[key] | length), True) %}

    {% do cnt_in_obj.append(dep_obj[key] | length ) %}
{% endfor %}

{% do log("DEBUG cnt_in_obj = " ~ cnt_in_obj, True) %}

{% set obj_cnt = cnt_in_obj | sum %}

{% do log("DEBUG obj_cnt = " ~ obj_cnt, True) %}

{% set result %}
{% if obj_cnt > 1 %}
    Модель {{ model_name }} зависит от {{ obj_cnt }} объектов!
{% endif %}
{% endset %}

{% do log("DEBUG result = " ~ result, True) %}
{% do log(result, True) %}

{% endif %}
{% endmacro %}