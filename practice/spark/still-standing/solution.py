from pyspark.sql.functions import col, current_date

result = (
    spark.table("api_tokens")
    .filter(
        (col("expires") > current_date()) |
        (col("expires").isNull())
    )
    .select("token_id", "issued", "requests")
    .orderBy(col("requests").desc())
    .limit(20)
)

result.show()
