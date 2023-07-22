# End-to-End Airbnb Data Pipeline Using Airflow

## Table of Contents
  - [Problem Definitions](https://github.com/aramadhanj/airbnb-data-pipeline/blob/main/README.md#problem-definitions)
  - [Used Technologies](https://github.com/aramadhanj/airbnb-data-pipeline/blob/main/README.md#used-technologies)
  - [Data Pipeline Architecture and Workflow](https://github.com/aramadhanj/airbnb-data-pipeline/blob/main/README.md#data-pipeline-architecture-and-workflow)

## Problem Definitions

This project showcases the best practices from [Data Engineering Zoomcamp](https://github.com/DataTalksClub/data-engineering-zoomcamp). I aim to build an end-to-end data pipeline and analyze Airbnb Bangkok Data.

Founded in August 2008 by Brian Chesky, Joe Gebbia, and Nathan Blecharczyk, Airbnb is an online marketplace and hospitality service that has revolutionized how people travel and find accommodations. The idea for Airbnb came about when the founders rented out air mattresses in their San Francisco apartment to help cover the cost of rent during a design conference in the city. This "airbed and breakfast" concept eventually evolved into the global platform we know today. Bangkok, the capital city of Thailand, is a major tourist destination with a wide range of properties listed on Airbnb. As a data enthusiast, you want to conduct an in-depth analysis of Airbnb listings in Bangkok to gain valuable property insights and understand market trends.

Interestingly, Airbnb data are publicly available [here](http://insideairbnb.com/get-the-data). The dataset is obtained from scraping conducted every quarter. The dataset provides information about listings or properties rented out, hosts, and others. In the dataset, there are more than 70 columns and approximately 15,000 rows of recorded listing information. However, the number of rows of data varies depending on the number of listings available in each city, with an average dataset size of about 45MB.

In this project, I am going to implement some data engineering best practices and gain interesting metrics, such as:
  1. Number of listings for each property type (count by listing id)
  2. Relationship between the daily rental price and the number of bedrooms and bathrooms
  3. Distribution of properties in Bangkok (using column latitude and longitude that was grouped)

## Used Technologies

This project utilizes such following tools that I learned from Data Engineering Zoomcamp.

  - Google Cloud Storage as the data lake to store our raw dataset.
  - Google Bigquery as the data warehouse.
  - dbt cloud as the transformation tool.
  - Airflow as workflow orchestration.
  - Terraform to easily manage the infrastructure.
  - Google Compute Engine as the virtual machine
  - Looker as the data visualization tool

## Data Pipeline Architecture and Workflow

![airbnb-pipeline drawio (1)](https://github.com/aramadhanj/airbnb-data-pipeline/blob/main/images/airbnb-pipeline.png)

The workflow is as follows:

### 1. Create, change, or destroy cloud resources

In this stage, I create a bucket in cloud storage and a dataset that will be used as the storage location for the data. Before creating resources in Terraform, I first set up a service account and add the necessary authorizations.

### 2. Download Data

In this stage, You will download the data from [here](insideairbnb.com).

### 3. Data Ingestion

In this stage, I moved the data that I previously downloaded in the previous stage to a bucket in Google Cloud Storage. Both the data download and data movement stages were executed using the Airflow tool

### 4. Load from External Table

In this stage, after the data is stored in Google Cloud Storage, the next step is to move the data to BigQuery as a data warehouse. However, at this stage, the data is still in its raw form and has not been transformed yet.

### 5. Implement Data Transformation with dbt

In this stage, data transformation is performed. Initially, the creation of staging and core folders takes place. The staging folder is used to display the entire dataset or selected columns that have been cleaned and had duplicate data removed. Next, in the core layer stage, new tables are created as fact tables that will be used in the visualization stage.

### 6. Data Visualization

![image](https://github.com/aramadhanj/airbnb-data-pipeline/blob/main/images/airbnb-dashboard.png)

[Link to access the dashboard](https://lookerstudio.google.com/reporting/f8fda6e9-0828-4de9-9232-cb527ef872c1)


Credit:
[Data Talks Club](https://github.com/DataTalksClub)
