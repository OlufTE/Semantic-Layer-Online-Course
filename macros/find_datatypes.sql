{% macro find_datatypes() %}
    {% set cols=adapter.get_columns_in_relation(fct_orders) %}
    {%- for col in cols %}
      - name: {{ col.name | lower }}
        data_type: {{ col.dtype | lower }}
    {%- endfor %}
{% endmacro %}