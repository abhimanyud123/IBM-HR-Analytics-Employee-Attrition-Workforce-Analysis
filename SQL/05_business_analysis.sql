/*
=========================================================
Project Name : IBM HR Analytics
File Name    : 05_business_analysis.sql

Description:
This script performs business analysis on the IBM HR
Analytics dataset to identify workforce trends,
employee attrition patterns, compensation insights,
and factors influencing employee retention.

Author       : Abhimanyu
Tools Used   : PostgreSQL
=========================================================
*/

-- =========================================
-- Business Analysis
-- =========================================

-- 1. Overall Employee Attrition Rate

SELECT
    attrition,
    COUNT(*) AS employee_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),2) AS percentage
FROM employee_data
GROUP BY attrition
ORDER BY percentage DESC;


-- 2. Attrition Rate by Department

SELECT
    department,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    COUNT(*) AS total_employees,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0 /
        COUNT(*),2
    ) AS attrition_rate
FROM employee_data
GROUP BY department
ORDER BY attrition_rate DESC;


-- 3. Attrition Rate by Job Role

SELECT
    job_role,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    COUNT(*) AS total_employees,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0 /
        COUNT(*),2
    ) AS attrition_rate
FROM employee_data
GROUP BY job_role
ORDER BY attrition_rate DESC;


-- 4. Attrition by Overtime

SELECT
    overtime,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    COUNT(*) AS total_employees,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0 /
        COUNT(*),2
    ) AS attrition_rate
FROM employee_data
GROUP BY overtime
ORDER BY attrition_rate DESC;


-- 5. Attrition by Business Travel

SELECT
    business_travel,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    COUNT(*) AS total_employees,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0 /
        COUNT(*),2
    ) AS attrition_rate
FROM employee_data
GROUP BY business_travel
ORDER BY attrition_rate DESC;


-- 6. Attrition by Age Group

SELECT
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50+'
    END AS age_group,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    COUNT(*) AS total_employees,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0 /
        COUNT(*),2
    ) AS attrition_rate
FROM employee_data
GROUP BY age_group
ORDER BY attrition_rate DESC;


-- 7. Average Monthly Income by Attrition

SELECT
    attrition,
    ROUND(AVG(monthly_income),2) AS average_monthly_income
FROM employee_data
GROUP BY attrition
ORDER BY average_monthly_income;


-- 8. Attrition by Job Satisfaction

SELECT
    job_satisfaction,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    COUNT(*) AS total_employees,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0 /
        COUNT(*),2
    ) AS attrition_rate
FROM employee_data
GROUP BY job_satisfaction
ORDER BY job_satisfaction;


-- 9. Attrition by Work-Life Balance

SELECT
    work_life_balance,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    COUNT(*) AS total_employees,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0 /
        COUNT(*),2
    ) AS attrition_rate
FROM employee_data
GROUP BY work_life_balance
ORDER BY work_life_balance;


-- 10. Attrition by Environment Satisfaction

SELECT
    environment_satisfaction,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    COUNT(*) AS total_employees,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0 /
        COUNT(*),2
    ) AS attrition_rate
FROM employee_data
GROUP BY environment_satisfaction
ORDER BY environment_satisfaction;


-- 11. Attrition by Years at Company

SELECT
    years_at_company,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    COUNT(*) AS total_employees,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0 /
        COUNT(*),2
    ) AS attrition_rate
FROM employee_data
GROUP BY years_at_company
ORDER BY years_at_company;


-- 12. Attrition by Marital Status

SELECT
    marital_status,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    COUNT(*) AS total_employees,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0 /
        COUNT(*),2
    ) AS attrition_rate
FROM employee_data
GROUP BY marital_status
ORDER BY attrition_rate DESC;


-- 13. Attrition by Gender

SELECT
    gender,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    COUNT(*) AS total_employees,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0 /
        COUNT(*),2
    ) AS attrition_rate
FROM employee_data
GROUP BY gender
ORDER BY attrition_rate DESC;


-- 14. Average Monthly Income by Department

SELECT
    department,
    ROUND(AVG(monthly_income),2) AS average_monthly_income
FROM employee_data
GROUP BY department
ORDER BY average_monthly_income DESC;


-- 15. Average Monthly Income by Job Role

SELECT
    job_role,
    ROUND(AVG(monthly_income),2) AS average_monthly_income
FROM employee_data
GROUP BY job_role
ORDER BY average_monthly_income DESC;


/*
=========================================================
Summary

This analysis answered key HR business questions related to:

• Overall employee attrition
• Department-wise attrition
• Job role attrition
• Overtime and business travel impact
• Age group analysis
• Compensation comparison
• Job satisfaction
• Work-life balance
• Environment satisfaction
• Employee tenure
• Marital status
• Gender
• Department salary comparison
• Job role salary comparison

These insights will be used to build the Power BI dashboard,
Business Insights documentation, and final project
recommendations.

=========================================================
*/