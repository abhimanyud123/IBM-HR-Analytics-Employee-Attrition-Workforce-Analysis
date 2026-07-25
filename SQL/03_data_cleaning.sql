/*
=========================================================
Project Name : IBM HR Analytics
File Name    : 03_data_cleaning.sql

Description:
This script performs data cleaning checks on the employee
dataset after data validation. It reviews the dataset for
duplicate records, missing values, invalid entries, and
data inconsistencies to ensure data quality before
analysis.

Based on the validation results, no data cleaning
operations were required as the dataset contained no
duplicate records, missing values, invalid values, or
data inconsistencies. Therefore, the original dataset was
retained without any modifications.

Author       : Abhimanyu
Tools Used   : PostgreSQL
=========================================================
*/

-- =========================================
-- Verify Duplicate Records
-- =========================================

SELECT
    employee_number,
    COUNT(*) AS duplicate_count
FROM employee_data
GROUP BY employee_number
HAVING COUNT(*) > 1;


-- =========================================
-- Verify Missing Values
-- =========================================

SELECT
    COUNT(*) FILTER (WHERE age IS NULL) AS age_nulls,
    COUNT(*) FILTER (WHERE attrition IS NULL) AS attrition_nulls,
    COUNT(*) FILTER (WHERE department IS NULL) AS department_nulls,
    COUNT(*) FILTER (WHERE job_role IS NULL) AS job_role_nulls,
    COUNT(*) FILTER (WHERE monthly_income IS NULL) AS monthly_income_nulls
FROM employee_data;


-- =========================================
-- Verify Constant Columns
-- =========================================

SELECT
    COUNT(DISTINCT employee_count) AS employee_count_values,
    COUNT(DISTINCT over18) AS over18_values,
    COUNT(DISTINCT standard_hours) AS standard_hours_values
FROM employee_data;


-- =========================================
-- Data Cleaning Summary
-- =========================================

/*
Cleaning Results

✓ No duplicate records found.

✓ No missing values detected.

✓ No invalid categorical values identified.

✓ No inconsistent records found.

✓ No data transformations were required.

Result:
The dataset met all quality standards and no cleaning
operations (UPDATE, DELETE, or ALTER) were necessary.
The original dataset was retained for further analysis.
*/