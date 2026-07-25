/*
=========================================================
Project Name : IBM HR Analytics
File Name    : 01_database_setup.sql

Description:
This script sets up the IBM HR Analytics database by
creating the employee table, importing the employee
dataset into PostgreSQL, and verifying that the data
has been imported successfully.

Author       : Abhimanyu
Tools Used   : PostgreSQL
=========================================================
*/

-- =========================================
-- Create Employee Table
-- =========================================

CREATE TABLE employee_data (
    age INTEGER,
    attrition VARCHAR(3),
    business_travel VARCHAR(30),
    daily_rate INTEGER,
    department VARCHAR(30),
    distance_from_home INTEGER,
    education INTEGER,
    education_field VARCHAR(50),
    employee_count INTEGER,
    employee_number INTEGER PRIMARY KEY,
    environment_satisfaction INTEGER,
    gender VARCHAR(10),
    hourly_rate INTEGER,
    job_involvement INTEGER,
    job_level INTEGER,
    job_role VARCHAR(50),
    job_satisfaction INTEGER,
    marital_status VARCHAR(20),
    monthly_income INTEGER,
    monthly_rate INTEGER,
    num_companies_worked INTEGER,
    over18 VARCHAR(1),
    overtime VARCHAR(3),
    percent_salary_hike INTEGER,
    performance_rating INTEGER,
    relationship_satisfaction INTEGER,
    standard_hours INTEGER,
    stock_option_level INTEGER,
    total_working_years INTEGER,
    training_times_last_year INTEGER,
    work_life_balance INTEGER,
    years_at_company INTEGER,
    years_in_current_role INTEGER,
    years_since_last_promotion INTEGER,
    years_with_curr_manager INTEGER
);

-- =========================================
-- Verify Data Import
-- =========================================

SELECT COUNT(*) AS total_records
FROM employee_data;

-- =========================================
-- Preview Imported Data
-- =========================================

SELECT *
FROM employee_data
LIMIT 10;