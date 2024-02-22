-- external table
SELECT COUNT(DISTINCT(PULocationID)) AS PULocationID_count
FROM `data-engineering-2024-414413.ny_taxi.external_green_tripdata`;

-- non-partioned table
SELECT COUNT(DISTINCT(PULocationID)) AS PULocationID_count
FROM `data-engineering-2024-414413.ny_taxi.external_green_tripdata_non_paritioned`;