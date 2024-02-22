## Module 3 Homework

<b>SETUP:</b></br>
Create an external table using the Green Taxi Trip Records Data for 2022. </br>

```sql
CREATE OR REPLACE EXTERNAL TABLE `data-engineering-2024-414413.ny_taxi.external_green_tripdata`
OPTIONS(
  format='Parquet',
  uris=[
    'gs://data-engineering-2024-bucket/green/*.parquet'
  ]
);
```

<p>Create a table in BQ using the Green Taxi Trip Records for 2022 (do not partition or cluster this table). </br>
</p>

```sql
CREATE OR REPLACE TABLE `data-engineering-2024-414413.ny_taxi.green_tripdata_non_partitioned`
AS SELECT * FROM
`data-engineering-2024-414413.ny_taxi.external_green_tripdata`;
```

## Question 1:

Question 1: What is count of records for the 2022 Green Taxi Data??

- 65,623,481
- 840,402
- 1,936,423
- 253,647

**Answer:** 840,402

## Question 2:

Write a query to count the distinct number of PULocationIDs for the entire dataset on both the tables.</br>
What is the estimated amount of data that will be read when this query is executed on the External Table and the Table?

- 0 MB for the External Table and 6.41MB for the Materialized Table
- 18.82 MB for the External Table and 47.60 MB for the Materialized Table
- 0 MB for the External Table and 0MB for the Materialized Table
- 2.14 MB for the External Table and 0MB for the Materialized Table

```sql
-- external table
SELECT COUNT(DISTINCT(PULocationID)) AS PULocationID_count
FROM `data-engineering-2024-414413.ny_taxi.external_green_tripdata`;

-- non-partioned table
SELECT COUNT(DISTINCT(PULocationID)) AS PULocationID_count
FROM `data-engineering-2024-414413.ny_taxi.external_green_tripdata_non_paritioned`;
```

**Answer:** 0 MB for the External Table and 6.41MB for the Materialized Table

## Question 3:

How many records have a fare_amount of 0?

- 12,488
- 128,219
- 112
- 1,622

```sql
-- non-partioned table
SELECT COUNT(*) AS PULocationID_count
FROM `data-engineering-2024-414413.ny_taxi.external_green_tripdata_non_paritioned`
WHERE fare_amount=0;
```

**Answer:** 1,622

## Question 4:

What is the best strategy to make an optimized table in Big Query if your query will always order the results by PUlocationID and filter based on lpep_pickup_datetime? (Create a new table with this strategy)

- Cluster on lpep_pickup_datetime Partition by PUlocationID
- Partition by lpep_pickup_datetime Cluster on PUlocationID
- Partition by lpep_pickup_datetime and Partition by PUlocationID
- Cluster on by lpep_pickup_datetime and Cluster on PUlocationID

```sql
CREATE OR REPLACE TABLE `data-engineering-2024-414413.ny_taxi.green_tripdata_partitioned_and_clustered`
PARTITION BY DATE(lpep_pickup_datetime)
CLUSTER BY PUlocationID
AS SELECT * FROM
`data-engineering-2024-414413.ny_taxi.external_green_tripdata`;
```

**Answer:** Partition by lpep_pickup_datetime Cluster on PUlocationID

## Question 5:

Write a query to retrieve the distinct PULocationID between lpep_pickup_datetime
06/01/2022 and 06/30/2022 (inclusive)</br>

Use the materialized table you created earlier in your from clause and note the estimated bytes. Now change the table in the from clause to the partitioned table you created for question 4 and note the estimated bytes processed. What are these values? </br>

Choose the answer which most closely matches.</br>

- 22.82 MB for non-partitioned table and 647.87 MB for the partitioned table
- 12.82 MB for non-partitioned table and 1.12 MB for the partitioned table
- 5.63 MB for non-partitioned table and 0 MB for the partitioned table
- 10.31 MB for non-partitioned table and 10.31 MB for the partitioned table

```sql
-- non-partitioned table
SELECT DISTINCT(PULocationID)
FROM `data-engineering-2024-414413.ny_taxi.green_tripdata_non_partitioned`
WHERE DATE(lpep_pickup_datetime) BETWEEN '2022-06-01' AND '2022-06-30';


-- partition and cluster table
SELECT DISTINCT(PULocationID)
FROM `data-engineering-2024-414413.ny_taxi.green_tripdata_partitioned_and_clustered`
WHERE DATE(lpep_pickup_datetime) BETWEEN '2022-06-01' AND '2022-06-30';

```

**Answer**: 12.82 MB for non-partitioned table and 1.12 MB for the partitioned table

## Question 6:

Where is the data stored in the External Table you created?

- Big Query
- GCP Bucket
- Big Table
- Container Registry

**Answer**: GCP Bucket

## Question 7:

It is best practice in Big Query to always cluster your data:

- True
- False

**Answer:** False

## (Bonus: Not worth points) Question 8:

No Points: Write a `SELECT count(*)` query FROM the materialized table you created. How many bytes does it estimate will be read? Why?

**Answer**: `0B` because BigQuery doesn't need to scan the entire table as the count of rows is precomputed when creating the materialized table in the metadata of the table.
