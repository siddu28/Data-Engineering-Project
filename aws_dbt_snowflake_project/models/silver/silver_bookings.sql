{{
  config(
    materialized = 'incremental',
    unique_key='BOOKING_ID'
    )
}}

select BOOKING_ID,LISTING_ID,BOOKING_DATE, {{multiply('NIGHTS_BOOKED','BOOKING_AMOUNT',2)}} as total_amount,SERVICE_FEE,CLEANING_FEE,
BOOKING_STATUS,CREATED_AT from {{ref('bronze_bookings')}}

