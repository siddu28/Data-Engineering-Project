# dbt wrapper script to avoid "Failed to canonicalize script path" error
# Usage: .\dbt.ps1 run --select models/demo
& "C:/Users/Siddu/Downloads/New folder/AWS_DBT_Snowflake/.venv/Scripts/python.exe" -c "from dbt.cli.main import cli; cli()" $args
