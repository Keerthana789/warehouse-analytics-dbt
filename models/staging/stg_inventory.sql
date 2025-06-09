SELECT
  item_id,
  location,
  current_stock
FROM {{ source('mfc_warehouse_raw', 'raw_inventory') }}
