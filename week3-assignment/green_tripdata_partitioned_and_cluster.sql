CREATE OR REPLACE TABLE `data-engineering-2024-414413.ny_taxi.green_tripdata_partitioned_and_clustered`
PARTITION BY DATE(lpep_pickup_datetime)
CLUSTER BY PUlocationID
AS SELECT * FROM
`data-engineering-2024-414413.ny_taxi.external_green_tripdata`;