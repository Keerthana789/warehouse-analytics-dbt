SELECT
  order_id,
  customer_id,
  item_id,
  order_time,
  quantity
FROM {{ source('mfc_warehouse_raw', 'raw_orders') }}
