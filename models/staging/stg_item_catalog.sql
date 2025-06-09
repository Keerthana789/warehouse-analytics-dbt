SELECT
  item_id,
  item_name,
  category,
  unit_price
FROM {{ source('mfc_warehouse_raw', 'raw_item_catalog') }}
