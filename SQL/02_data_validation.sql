/*
=========================================================
Project Name : IBM HR Analytics
File Name    : 02_data_validation.sql

Description:
This script validates the integrity and quality of the
employee dataset after importing it into PostgreSQL.
It checks for duplicate records, missing values,
constant columns, invalid values, and verifies that
the data is ready for analysis.

Author       : Abhimanyu
Tools Used   : PostgreSQL
=========================================================
*/

-- =========================================
-- Total Records
-- =========================================

SELECT COUNT(*) AS total_records
FROM employee_data;


-- =========================================
-- Duplicate Employee Numbers
-- =========================================

SELECT
    employee_number,
    COUNT(*) AS duplicate_count
FROM employee_data
GROUP BY employee_number
HAVING COUNT(*) > 1;


-- =========================================
-- Missing Values
-- =========================================

SELECT
    COUNT(*) FILTER (WHERE age IS NULL) AS age_nulls,
    COUNT(*) FILTER (WHERE attrition IS NULL) AS attrition_nulls,
    COUNT(*) FILTER (WHERE business_travel IS NULL) AS business_travel_nulls,
    COUNT(*) FILTER (WHERE daily_rate IS NULL) AS daily_rate_nulls,
    COUNT(*) FILTER (WHERE department IS NULL) AS department_nulls,
    COUNT(*) FILTER (WHERE distance_from_home IS NULL) AS distance_nulls,
    COUNT(*) FILTER (WHERE education IS NULL) AS education_nulls,
    COUNT(*) FILTER (WHERE education_field IS NULL) AS education_field_nulls,
    COUNT(*) FILTER (WHERE employee_count IS NULL) AS employee_count_nulls,
    COUNT(*) FILTER (WHERE employee_number IS NULL) AS employee_number_nulls,
    COUNT(*) FILTER (WHERE environment_satisfaction IS NULL) AS environment_nulls,
    COUNT(*) FILTER (WHERE gender IS NULL) AS gender_nulls,
    COUNT(*) FILTER (WHERE hourly_rate IS NULL) AS hourly_rate_nulls,
    COUNT(*) FILTER (WHERE job_involvement IS NULL) AS job_involvement_nulls,
    COUNT(*) FILTER (WHERE job_level IS NULL) AS job_level_nulls,
    COUNT(*) FILTER (WHERE job_role IS NULL) AS job_role_nulls,
    COUNT(*) FILTER (WHERE job_satisfaction IS NULL) AS job_satisfaction_nulls,
    COUNT(*) FILTER (WHERE marital_status IS NULL) AS marital_status_nulls,
    COUNT(*) FILTER (WHERE monthly_income IS NULL) AS monthly_income_nulls,
    COUNT(*) FILTER (WHERE monthly_rate IS NULL) AS monthly_rate_nulls,
    COUNT(*) FILTER (WHERE num_companies_worked IS NULL) AS companies_nulls,
    COUNT(*) FILTER (WHERE over18 IS NULL) AS over18_nulls,
    COUNT(*) FILTER (WHERE overtime IS NULL) AS overtime_nulls,
    COUNT(*) FILTER (WHERE percent_salary_hike IS NULL) AS salary_hike_nulls,
    COUNT(*) FILTER (WHERE performance_rating IS NULL) AS performance_nulls,
    COUNT(*) FILTER (WHERE relationship_satisfaction IS NULL) AS relationship_nulls,
    COUNT(*) FILTER (WHERE standard_hours IS NULL) AS standard_hours_nulls,
    COUNT(*) FILTER (WHERE stock_option_level IS NULL) AS stock_option_nulls,
    COUNT(*) FILTER (WHERE total_working_years IS NULL) AS working_years_nulls,
    COUNT(*) FILTER (WHERE training_times_last_year IS NULL) AS training_nulls,
    COUNT(*) FILTER (WHERE work_life_balance IS NULL) AS work_life_balance_nulls,
    COUNT(*) FILTER (WHERE years_at_company IS NULL) AS years_company_nulls,
    COUNT(*) FILTER (WHERE years_in_current_role IS NULL) AS current_role_nulls,
    COUNT(*) FILTER (WHERE years_since_last_promotion IS NULL) AS promotion_nulls,
    COUNT(*) FILTER (WHERE years_with_curr_manager IS NULL) AS manager_nulls
FROM employee_data;


-- =========================================
-- Constant Columns Validation
-- =========================================

SELECT
    COUNT(DISTINCT employee_count) AS employee_count_values,
    COUNT(DISTINCT over18) AS over18_values,
    COUNT(DISTINCT standard_hours) AS standard_hours_values
FROM employee_data;


-- =========================================
-- Validate Attrition Values
-- =========================================

SELECT DISTINCT attrition
FROM employee_data
ORDER BY attrition;


-- =========================================
-- Validate Gender Values
-- =========================================

SELECT DISTINCT gender
FROM employee_data
ORDER BY gender;


-- =========================================
-- Validate Business Travel Values
-- =========================================

SELECT DISTINCT business_travel
FROM employee_data
ORDER BY business_travel;


-- =========================================
-- Validate Department Values
-- =========================================

SELECT DISTINCT department
FROM employee_data
ORDER BY department;


-- =========================================
-- Validate Education Field Values
-- =========================================

SELECT DISTINCT education_field
FROM employee_data
ORDER BY education_field;


-- =========================================
-- Validate Job Role Values
-- =========================================

SELECT DISTINCT job_role
FROM employee_data
ORDER BY job_role;


-- =========================================
-- Validate Marital Status Values
-- =========================================

SELECT DISTINCT marital_status
FROM employee_data
ORDER BY marital_status;


-- =========================================
-- Validate Overtime Values
-- =========================================

SELECT DISTINCT overtime
FROM employee_data
ORDER BY overtime;


-- =========================================
-- Validate Numeric Ranges
-- =========================================

SELECT
    MIN(age) AS min_age,
    MAX(age) AS max_age,

    MIN(distance_from_home) AS min_distance,
    MAX(distance_from_home) AS max_distance,

    MIN(daily_rate) AS min_daily_rate,
    MAX(daily_rate) AS max_daily_rate,

    MIN(monthly_income) AS min_monthly_income,
    MAX(monthly_income) AS max_monthly_income,

    MIN(total_working_years) AS min_working_years,
    MAX(total_working_years) AS max_working_years,

    MIN(years_at_company) AS min_years_company,
    MAX(years_at_company) AS max_years_company,

    MIN(years_in_current_role) AS min_current_role,
    MAX(years_in_current_role) AS max_current_role,

    MIN(years_since_last_promotion) AS min_promotion,
    MAX(years_since_last_promotion) AS max_promotion,

    MIN(years_with_curr_manager) AS min_manager_years,
    MAX(years_with_curr_manager) AS max_manager_years
FROM employee_data;


-- =========================================
-- Dataset Validation Complete
-- =========================================

/*
Expected Results

✓ Total Records = 1470

✓ Duplicate Employee Numbers = 0 rows

✓ Missing Values = 0 across all columns

✓ EmployeeCount = 1 unique value

✓ Over18 = 1 unique value

✓ StandardHours = 1 unique value

✓ Attrition = Yes, No

✓ Gender = Male, Female

✓ BusinessTravel = 3 categories

✓ Department = 3 categories

✓ No unreasonable numeric values

Result:
Dataset successfully validated and ready for
exploratory and business analysis.
*/