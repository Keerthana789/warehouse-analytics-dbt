SELECT
  order_id,
  reason_category,
  description
FROM {{ source('mfc_warehouse_raw', 'raw_delay_reasons') }}

