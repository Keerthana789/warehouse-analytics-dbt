{{ config(materialized='table') }}

SELECT
  reason_category,
  COUNT(*) AS delay_count
FROM {{ ref('stg_delay_reasons') }}
WHERE reason_category != 'reason_category' 
GROUP BY reason_category

