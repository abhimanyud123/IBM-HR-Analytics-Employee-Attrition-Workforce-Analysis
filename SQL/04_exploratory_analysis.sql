/*
=========================================================
Project Name : IBM HR Analytics
File Name    : 04_exploratory_analysis.sql

Description:
This script performs exploratory data analysis (EDA) on
the IBM HR Analytics dataset. It explores employee
demographics, job characteristics, compensation,
experience, performance, and workforce distribution to
gain a comprehensive understanding of the dataset before
conducting business analysis.

Author       : Abhimanyu
Tools Used   : PostgreSQL
=========================================================
*/

-- =========================================
-- Employee Overview
-- =========================================

-- 1. Total Number of Employees

SELECT COUNT(*) AS total_employees
FROM employee_data;


-- 2. Total Departments

SELECT COUNT(DISTINCT department) AS total_departments
FROM employee_data;


-- 3. Total Job Roles

SELECT COUNT(DISTINCT job_role) AS total_job_roles
FROM employee_data;


-- 4. Total Education Fields

SELECT COUNT(DISTINCT education_field) AS total_education_fields
FROM employee_data;


-- =========================================
-- Employee Demographics
-- =========================================

-- 5. Gender Distribution

SELECT
    gender,
    COUNT(*) AS employee_count
FROM employee_data
GROUP BY gender
ORDER BY employee_count DESC;


-- 6. Marital Status Distribution

SELECT
    marital_status,
    COUNT(*) AS employee_count
FROM employee_data
GROUP BY marital_status
ORDER BY employee_count DESC;


-- 7. Education Level Distribution

SELECT
    CASE education
        WHEN 1 THEN 'Below College'
        WHEN 2 THEN 'College'
        WHEN 3 THEN 'Bachelor'
        WHEN 4 THEN 'Master'
        WHEN 5 THEN 'Doctor'
    END AS education_level,
    COUNT(*) AS employee_count
FROM employee_data
GROUP BY education
ORDER BY education;


-- 8. Age Statistics

SELECT
    MIN(age) AS minimum_age,
    MAX(age) AS maximum_age,
    ROUND(AVG(age),2) AS average_age
FROM employee_data;


-- =========================================
-- Job Information
-- =========================================

-- 9. Department Distribution

SELECT
    department,
    COUNT(*) AS employee_count
FROM employee_data
GROUP BY department
ORDER BY employee_count DESC;


-- 10. Job Role Distribution

SELECT
    job_role,
    COUNT(*) AS employee_count
FROM employee_data
GROUP BY job_role
ORDER BY employee_count DESC;


-- 11. Business Travel Distribution

SELECT
    business_travel,
    COUNT(*) AS employee_count
FROM employee_data
GROUP BY business_travel
ORDER BY employee_count DESC;


-- 12. Overtime Distribution

SELECT
    overtime,
    COUNT(*) AS employee_count
FROM employee_data
GROUP BY overtime
ORDER BY employee_count DESC;


-- =========================================
-- Compensation Analysis
-- =========================================

-- 13. Monthly Income Statistics

SELECT
    MIN(monthly_income) AS minimum_income,
    MAX(monthly_income) AS maximum_income,
    ROUND(AVG(monthly_income),2) AS average_income
FROM employee_data;


-- 14. Daily Rate Statistics

SELECT
    MIN(daily_rate) AS minimum_daily_rate,
    MAX(daily_rate) AS maximum_daily_rate,
    ROUND(AVG(daily_rate),2) AS average_daily_rate
FROM employee_data;


-- 15. Hourly Rate Statistics

SELECT
    MIN(hourly_rate) AS minimum_hourly_rate,
    MAX(hourly_rate) AS maximum_hourly_rate,
    ROUND(AVG(hourly_rate),2) AS average_hourly_rate
FROM employee_data;


-- =========================================
-- Employee Experience
-- =========================================

-- 16. Total Working Years Statistics

SELECT
    MIN(total_working_years) AS minimum_working_years,
    MAX(total_working_years) AS maximum_working_years,
    ROUND(AVG(total_working_years),2) AS average_working_years
FROM employee_data;


-- 17. Years at Company Statistics

SELECT
    MIN(years_at_company) AS minimum_years_at_company,
    MAX(years_at_company) AS maximum_years_at_company,
    ROUND(AVG(years_at_company),2) AS average_years_at_company
FROM employee_data;


-- =========================================
-- Employee Satisfaction
-- =========================================

-- 18. Satisfaction Score Summary

SELECT
    ROUND(AVG(job_satisfaction),2) AS average_job_satisfaction,
    ROUND(AVG(environment_satisfaction),2) AS average_environment_satisfaction,
    ROUND(AVG(work_life_balance),2) AS average_work_life_balance,
    ROUND(AVG(job_involvement),2) AS average_job_involvement,
    ROUND(AVG(relationship_satisfaction),2) AS average_relationship_satisfaction
FROM employee_data;