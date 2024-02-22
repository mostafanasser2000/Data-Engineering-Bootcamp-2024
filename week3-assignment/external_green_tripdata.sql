CREATE OR REPLACE EXTERNAL TABLE `data-engineering-2024-414413.ny_taxi.external_green_tripdata`
OPTIONS(
  format='Parquet',
  uris=[
    'gs://data-engineering-2024-bucket/green/*.parquet'
  ]
);