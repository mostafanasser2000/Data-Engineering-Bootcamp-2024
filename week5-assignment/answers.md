## Week 5 Homework

### Question 1:

**Install Spark and PySpark**

- Install Spark
- Run PySpark
- Create a local spark session
- Execute spark.version.

What's the output?

<details>
  <summary><strong>Answer</strong></summary>
  3.3.2
</details>

### Question 2:

**FHV October 2019**

Read the October 2019 FHV into a Spark Dataframe with a schema as we did in the lessons.

Repartition the Dataframe to 6 partitions and save it to parquet.

What is the average size of the Parquet (ending with .parquet extension) Files that were created (in MB)? Select the answer which most closely matches.

- 1MB
- 6MB
- 25MB
- 87MB

<details>
  <summary><strong>Answer</strong></summary>
  6MB
</details>

### Question 3:

**Count records**

How many taxi trips were there on the 15th of October?

Consider only trips that started on the 15th of October.

- 108,164
- 12,856
- 452,470
- 62,610

<details>
  <summary><strong>Answer</strong></summary>62610
</details>

### Question 4:

**Longest trip for each day**

What is the length of the longest trip in the dataset in hours?

- 631,152.50 Hours
- 243.44 Hours
- 7.68 Hours
- 3.32 Hours

<details>
  <summary><strong>Answer</strong></summary>631152
</details>

### Question 5:

**User Interface**

Spark’s User Interface which shows the application's dashboard runs on which local port?

- 80
- 443
- 4040
- 8080

<details>
  <summary><strong>Answer</strong></summary>4040
</details>

### Question 6:

**Least frequent pickup location zone**

Using the zone lookup data and the FHV October 2019 data, what is the name of the LEAST frequent pickup location Zone?</br>

- East Chelsea
- Jamaica Bay
- Union Sq
- Crown Heights North

<details>
  <summary><strong>Answer</strong></summary>Jamaica Bay
</details>
