# 🏭 MFC Warehouse Analytics (dbt + BigQuery)

This project simulates a warehouse operations analytics pipeline using **dbt** and **BigQuery**, with raw data modeled through staging and marts layers to enable powerful performance tracking and operational insights.

## 📌 Project Goals

- Transform messy operational logs into clean, analytics-ready models
- Track picker efficiency, delay causes, and item metadata
- Demonstrate best practices in dbt: sources, staging, marts, testing, and documentation
- Simulate a real-world warehouse data environment with synthetic data

---

## 🧱 Project Structure

```
mfc_warehouse_analytics/
├── models/
│   ├── staging/               -- Source-cleaning models (views)
│   │   ├── stg_orders.sql
│   │   ├── stg_pick_logs.sql
│   │   ├── stg_inventory.sql
│   │   ├── stg_delay_reasons.sql
│   │   └── stg_item_catalog.sql
│   ├── marts/                 -- Final business-layer models (tables)
│   │   ├── fct_picking_efficiency.sql
│   │   ├── dim_items.sql
│   │   └── dim_delay_reason.sql
│   └── schema.yml             -- Descriptions and tests for marts
├── macros/
├── seeds/
├── tests/
├── snapshots/
├── dbt_project.yml
└── README.md
```

---

## 🧪 Key Models

### `fct_picking_efficiency`
Tracks picker performance with metrics like:
- total picks
- average pick duration
- picks with issues
- delayed orders

### `dim_items`
Contains item metadata: ID, name, category, and unit price.

### `dim_delay_reason`
Summarized count of issue types across all delayed orders.

---

## ✅ Features Implemented

- 🔗 **Source Definitions** from raw BigQuery tables
- 🧼 **Staging Layer** for data type casting and column cleanup
- 🧠 **Marts Layer** with facts and dimensions for analysis
- 🔍 **dbt Tests**: `unique`, `not_null`, and relationship checks
- 📚 **Model + Column Documentation** for auto-generated `dbt docs`
- 🛠️ **BigQuery Views and Tables** via dbt materializations

---

## 📊 Example Use Cases

- Identify bottlenecks in MFC picker workflows
- Quantify the most common delay categories
- Analyze inventory and item-level performance

---

## 🛠️ Setup Instructions

1. Clone this repo
2. Set up a BigQuery project + datasets (e.g., `mfc_warehouse_raw`, `mfc_dbt`)
3. Update your `profiles.yml` or dbt Cloud environment
4. Run:

```bash
dbt debug
dbt run
dbt test
dbt docs generate && dbt docs serve
```

---