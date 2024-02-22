-- non-partioned table
SELECT COUNT(*) AS PULocationID_count
FROM `data-engineering-2024-414413.ny_taxi.external_green_tripdata_non_paritioned`
WHERE fare_amount=0;