{{ config(materialized='table') }}

WITH picks AS (
  SELECT
    order_id,
    picker_id,
    DATETIME_DIFF(pick_end, pick_start, MINUTE) AS pick_duration_minutes,
    issue_flag
  FROM {{ ref('stg_pick_logs') }}
),

delays AS (
  SELECT DISTINCT order_id
  FROM {{ ref('stg_delay_reasons') }}
)

SELECT
  picker_id,
  COUNT(order_id) AS total_picks,
  AVG(pick_duration_minutes) AS avg_pick_time_minutes,
  SUM(CASE WHEN issue_flag = 1 THEN 1 ELSE 0 END) AS picks_with_issues,
  COUNT(DISTINCT CASE WHEN d.order_id IS NOT NULL THEN p.order_id END) AS delayed_orders
FROM picks p
LEFT JOIN delays d USING(order_id)
GROUP BY picker_id
