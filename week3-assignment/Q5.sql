-- nonpartioned table
-- This query will process 12.82 MB when run.
SELECT DISTINCT(PULocationID)
FROM `data-engineering-2024-414413.ny_taxi.green_tripdata_non_partitioned`
WHERE DATE(lpep_pickup_datetime) BETWEEN '2022-06-01' AND '2022-06-30';


-- partition table
-- This query will process 1.12 MB when run.
SELECT DISTINCT(PULocationID)
FROM `data-engineering-2024-414413.ny_taxi.green_tripdata_partitioned_and_clustered`
WHERE DATE(lpep_pickup_datetime) BETWEEN '2022-06-01' AND '2022-06-30';
