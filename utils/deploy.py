import snowflake.connector

# Replace with environment variables from GitHub Secrets
conn = snowflake.connector.connect(
    user=os.environ["SNOWFLAKE_USER"],
    password=os.environ["SNOWFLAKE_PASSWORD"],
    account=os.environ["SNOWFLAKE_ACCOUNT"],
    warehouse=os.environ["SNOWFLAKE_WAREHOUSE"],
    database=os.environ["SNOWFLAKE_DATABASE"],
    schema=os.environ["SNOWFLAKE_SCHEMA"],
    role=os.environ["SNOWFLAKE_ROLE"]
)

cursor = conn.cursor()

# List of scripts to run
scripts = [
    "schemas/ff_schema.sql",
    "schemas/stg_schema.sql",
    "schemas/tbl_schema.sql",
    "pipelines/load_customer_data.sql"
]

for script in scripts:
    with open(script, "r") as f:
        sql = f.read()
        for statement in sql.split(";"):
            if statement.strip():
                cursor.execute(statement)

cursor.close()
conn.close()
