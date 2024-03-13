# Question 1

creating materialized view

```sql

CREATE MATERIALIZED VIEW avg_max_min_trip_time_2_zones_view AS
SELECT
    taxi_zone1.Zone as pickup_zone,
    taxi_zone2.Zone as dropoff_zone,
    AVG(tpep_dropoff_datetime - tpep_pickup_datetime) AS avg_trip_time,
    MAX(tpep_dropoff_datetime - tpep_pickup_datetime) AS max_trip_time,
    MIN(tpep_dropoff_datetime - tpep_pickup_datetime) AS min_trip_time

FROM trip_data
JOIN taxi_zone as taxi_zone1
    ON trip_data.PULocationID = taxi_zone1.location_id
JOIN taxi_zone as taxi_zone2
    ON trip_data.DOLocationID = taxi_zone2.location_id
GROUP BY pickup_zone, dropoff_zone
```

max average between two zones

```sql
SELECT
    taxi_zone1.Zone as pickup_zone,
    taxi_zone2.Zone as dropoff_zone

FROM trip_data
JOIN taxi_zone as taxi_zone1
    ON trip_data.PULocationID = taxi_zone1.location_id
JOIN taxi_zone as taxi_zone2
    ON trip_data.DOLocationID = taxi_zone2.location_id
GROUP BY pickup_zone, dropoff_zone
HAVING AVG(tpep_dropoff_datetime - tpep_pickup_datetime)  = (SELECT MAX(avg_trip_time) FROM avg_max_min_trip_time_2_zones_view);

```

<details>
  <summary><strong>Answer</strong></summary>
  Yorkville East, Steinway
</details>

# Question 2

number of trips for the pair of taxi zones with the highest average trip time.

```sql
SELECT
    taxi_zone1.Zone as pickup_zone,
    taxi_zone2.Zone as dropoff_zone,
    COUNT(*) as number_of_trips

FROM trip_data
JOIN taxi_zone as taxi_zone1
    ON trip_data.PULocationID = taxi_zone1.location_id
JOIN taxi_zone as taxi_zone2
    ON trip_data.DOLocationID = taxi_zone2.location_id
GROUP BY pickup_zone, dropoff_zone
HAVING AVG(tpep_dropoff_datetime - tpep_pickup_datetime)  = (SELECT MAX(avg_trip_time) FROM avg_max_min_trip_time_2_zones_view);
```

<details>
  <summary><strong>Answer</strong></summary>
  1
</details>

# Question 3

materialized view for latest_pickups

```sql
CREATE MATERIALIZED VIEW latest_pickups AS
SELECT taxi_zone.Zone as pickup_zone, taxi_zone_1.Zone as dropoff_zone, tpep_pickup_datetime, tpep_dropoff_datetime
FROM trip_data
JOIN taxi_zone ON trip_data.PULocationID = taxi_zone.location_id
JOIN taxi_zone as taxi_zone_1 ON trip_data.DOLocationID = taxi_zone_1.location_id

```

top 3 busiest zones from the latest pickup time to 17 hours
before

```sql
WITH latest_pickups AS (
    SELECT MAX(tpep_pickup_datetime) AS max_pickup_datetime
    FROM trip_data
)
SELECT
    taxi_zone.Zone as pickup_zone,
    COUNT(*) AS pickup_cnt
FROM
    trip_data
JOIN taxi_zone ON trip_data.PULocationID = taxi_zone.location_id
JOIN latest_pickups on true
WHERE trip_data.tpep_pickup_datetime BETWEEN (latest_pickups.max_pickup_datetime - INTERVAL '17 hour') AND latest_pickups.max_pickup_datetime
GROUP BY pickup_zone
ORDER BY pickup_cnt DESC
LIMIT 3;
```

<details>
  <summary><strong>Answer</strong></summary>
  LaGuardia Airport, JFK Airport, Lincoln Square East
</details>
