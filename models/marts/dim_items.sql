{{ config(materialized='table') }}

SELECT
  item_id,
  item_name,
  category,
  unit_price
FROM {{ ref('stg_item_catalog') }}
