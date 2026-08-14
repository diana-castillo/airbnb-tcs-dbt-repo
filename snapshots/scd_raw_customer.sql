{% snapshot scd_raw_customer %}

{{
   config(
       target_schema='dev',
       unique_key='Customer_ID',
       strategy='check',
       check_cols = ['Customer_State'],
       invalidate_hard_deletes=True
   )
}}

select * FROM AIRBNB.RAW.RAW_CUSTOMER

{% endsnapshot %}