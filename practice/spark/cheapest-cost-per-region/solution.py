from pyspark.sql.functions import split, size, col

df = spark.table("cloud_costs")

result = df.groupBy("region")
  .agg(min("amount").alias("min_count"))
  
result.show()
