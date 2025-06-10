{{ config(materialized='table') }}

SELECT
  i.item_id,
  c.item_name,
  c.category,
  i.location,
  i.current_stock,
  c.unit_price
FROM {{ ref('stg_inventory') }} i
LEFT JOIN {{ ref('stg_item_catalog') }} c
  ON i.item_id = c.item_id
