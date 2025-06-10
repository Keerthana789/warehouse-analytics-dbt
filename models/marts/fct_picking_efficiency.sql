{{ config(materialized='table') }}

WITH picks AS (
  SELECT
    l.order_id,
    o.item_id,
    l.picker_id,
    DATETIME_DIFF(l.pick_end, l.pick_start, MINUTE) AS pick_duration_minutes,
    l.issue_flag
  FROM {{ ref('stg_pick_logs') }} l
  LEFT JOIN {{ ref('stg_orders') }} o
    ON l.order_id = o.order_id
),

items AS (
  SELECT
    item_id,
    category,
    unit_price
  FROM {{ ref('stg_item_catalog') }}
),

delays AS (
  SELECT DISTINCT order_id
  FROM {{ ref('stg_delay_reasons') }}
)

SELECT
  p.picker_id,
  COUNT(p.order_id) AS total_picks,
  AVG(p.pick_duration_minutes) AS avg_pick_time_minutes,
  SUM(CASE WHEN p.issue_flag = 1 THEN 1 ELSE 0 END) AS picks_with_issues,
  COUNT(DISTINCT CASE WHEN d.order_id IS NOT NULL THEN p.order_id END) AS delayed_orders,
  i.category,
  ROUND(AVG(i.unit_price), 2) AS avg_item_price
FROM picks p
LEFT JOIN delays d ON p.order_id = d.order_id
LEFT JOIN items i ON p.item_id = i.item_id
GROUP BY p.picker_id, i.category
