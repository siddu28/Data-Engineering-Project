{% set configs = [
    {
        "table":ref('obt'),
        "columns":"GOLD_obt.BOOKING_ID,GOLD_obt.LISTING_ID,GOLD_obt.HOST_ID,GOLD_obt.TOTAL_AMOUNT, GOLD_obt.SERVICE_FEE,GOLD_obt.CLEANING_FEE,GOLD_obt.ACCOMMODATES,GOLD_obt.BEDROOMS,GOLD_obt.BATHROOMS,GOLD_obt.PRICE_PER_NIGHT,GOLD_obt.RESPONSE_RATE",
        "alias":"GOLD_obt"
    },
    {
        "table":ref('dim_listings'),
        "columns":"",
        "join_condition":"GOLD_obt.listing_id=dim_listings.listing_id",
        "alias":"dim_listings"
    },
    {
        "table":ref('dim_hosts'),
        "columns":"",
        "join_condition":"GOLD_obt.host_id=dim_hosts.host_id",
        "alias":"dim_hosts"
    }
]%}


select
        {{configs[0]['columns']}}
from
    {% for config in configs %}
        {% if loop.first %}
            {{config['table']}} as {{config['alias']}}
        {%else%}
            left join {{config['table']}} as {{config['alias']}}
            on {{config['join_condition']}}
            {% endif %}
    {% endfor %}
    