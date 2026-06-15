USE cyclistic_bike_database;
GO

-- Dim User Type 
CREATE TABLE dim_user_type (
    user_type_id INT IDENTITY(1,1) PRIMARY KEY,
    user_type VARCHAR(50) NOT NULL 
);

-- Dim Rideable Type
CREATE TABLE dim_rideable_type (
    rideable_type_id INT IDENTITY(1,1) PRIMARY KEY,
    rideable_type VARCHAR(50) NOT NULL 
);

-- Dim Station
CREATE TABLE dim_station (
    station_key INT IDENTITY(1,1) PRIMARY KEY,
    station_id VARCHAR(50),
    station_name VARCHAR(255),
    lat FLOAT,
    lng FLOAT
);

-- Dim Date
CREATE TABLE dim_date(
    date_id INT IDENTITY(1, 1) PRIMARY KEY,
    full_date DATE, 
    year INT,
    month VARCHAR(15),
    day_of_month INT, 
    day_of_week VARCHAR(15), 
    hour INT, 
    is_weekend INT
);
-- Fact Table
CREATE TABLE fact_bike_trips (
    ride_id VARCHAR(100) PRIMARY KEY,
    date_id INT REFERENCES dim_date(date_id),
    user_type_id INT REFERENCES dim_user_type(user_type_id),
    rideable_type_id INT REFERENCES dim_rideable_type(rideable_type_id),
    start_station_key INT REFERENCES dim_station(station_key),
    end_station_key INT REFERENCES dim_station(station_key),
    started_at DATETIME,
    ended_at DATETIME,
    ride_length INT,         
    distance INT             
);
GO

