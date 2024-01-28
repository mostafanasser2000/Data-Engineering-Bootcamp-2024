# Assignment 1 Answers

## Question 1. Knowing docker tags

- Which tag has the following text? - Automatically remove the container when it exits?

  - **Answer**: `--rm`

## Question 2. Understanding docker first run

What is version of the package wheel?

1. build docker image on the current directory

```bash
docker build -t your_image_name:tag .
```

2. run image

```bash
docker run -it your_image_name:tag
```

3. check python version

```bash
python --version
```

4. get `wheel` package version.

```bash
pip list | grep wheel
```

- **Answer:** `0.42.0`

## Question 3. Count records

How many taxi trips were totally made on September 18th 2019?

- **SQL Query**

  ```sql
  SELECT COUNT(1) FROM green_trip_data WHERE DATE (lpep_pickup_datetime) = DATE ('2019-09-18') AND DATE(lpep_dropoff_datetime) = DATE ('2019-09-18');
  ```

  <br>

- **Answer:** `15612`

## Question 4. Largest trip for each day

Which was the pick up day with the largest trip distance
Use the pick up time for your calculations?

- **SQL Query**

  ```sql
  SELECT DATE(lpep_pickup_datetime )FROM green_trip_data  ORDER BY trip_distance DESC LIMIT 1;
  ```

  <br>

- **Answer:** `2019-09-26`

## Question 5. Three biggest pick up Boroughs

Which were the 3 pick up Boroughs that had a sum of total_amount superior to 50000?

- **SQL Query**

  ```sql
  SELECT taxi_zone."Borough"
  FROM taxi_zone
  LEFT JOIN green_trip_data
  ON green_trip_data."PULocationID" = taxi_zone."LocationID"
  WHERE DATE(green_trip_data.lpep_pickup_datetime) = DATE('2019-09-18') AND taxi_zone."Borough" != "Unknown"
  GROUP BY(taxi_zone."Borough")
  HAVING SUM(green_trip_data.total_amount) > 50000
  ```

- **Answer:** `Brooklyn, Manhattan, Queens`

## Question 6. Largest tip

For the passengers picked up in September 2019 in the zone name Astoria which was the drop off zone that had the largest tip?

- **SQL Query**

  ```sql
  SELECT taxi_zone."Zone"
  FROM green_trip_data
  JOIN taxi_zone
  ON green_trip_data."DOLocationID" = taxi_zone."LocationID"
  WHERE green_trip_data.tip_amount = (SELECT MAX(green_trip_data.tip_amount)
  FROM green_trip_data
  JOIN taxi_zone
  ON green_trip_data."PULocationID" = taxi_zone."LocationID"
  WHERE taxi_zone."Zone" = 'Astoria');
  ```

- **Answer:** `JFK Airport`
