SELECT
  order_id,
  picker_id,
  pick_start,
  pick_end,
  issue_flag
FROM {{ source('mfc_warehouse_raw', 'raw_pick_logs') }}
