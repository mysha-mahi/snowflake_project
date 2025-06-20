# Snowflake Data Load Project (POC → Production)

This project demonstrates a modular Snowflake data pipeline setup using external file sources (S3) and reusable objects like file formats and stages.

---

## 📁 Folder Structure

| Folder         | Purpose |
|----------------|---------|
| `schemas/`     | Contains DDL for schemas, file formats, stages, and tables |
| `pipelines/`   | Contains data loading logic using `COPY INTO` |
| `utils/`       | Reserved for role/warehouse setup |
| `audit/`       | (Optional) Audit logs, data lineage, load tracking |

---

## ✅ Execution Order (Manual)

1. Create file formats → `schemas/ff_schema.sql`
2. Create external stage + integration → `schemas/stg_schema.sql`
3. Create destination table → `schemas/tbl_schema.sql`
4. Run COPY command → `pipelines/load_customer_data.sql`

---

## 📌 Notes

- S3 Integration: Using AWS IAM Role ARN `arn:aws:iam::060795945398:role/snowflake_learner`
- Source file: `customer_data_2020.csv`
- File format: Pipe-delimited CSV (`|`), with 1 header row skipped

---

## 🚀 Next Steps (Suggested)

- Add a `PIPE` and `TASK` to automate loads
- Implement `STREAM` for change tracking
- Add load metadata logging
