CREATE OR REPLACE TABLE `data-engineering-2024-414413.ny_taxi.green_tripdata_non_partitioned`
AS SELECT * FROM
`data-engineering-2024-414413.ny_taxi.external_green_tripdata`;