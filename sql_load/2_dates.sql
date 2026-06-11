CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;


CREATE TABLE february_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;


CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;


SELECT job_posted_date
FROM march_jobs;




SELECT
    job_schedule_type AS schedule_type,
    AVG(salary_year_avg) AS yearly_average,
    AVG(Salary_hour_avg) AS hourly_average
FROM
    job_postings_fact
WHERE
    job_posted_date > '2023-06-01'
GROUP BY
    schedule_type
ORDER BY
    schedule_type;


SELECT
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS date_month,
    COUNT(job_id) AS count_jobs
FROM
    job_postings_fact
GROUP BY
    date_month
ORDER BY
    date_month;





/*
Problem Statement

Find companies (include company name) that have posted jobs offering health insurance, 

where these postings were made in the second quarter of 2023. Use date extraction to filter by quarter. 

And order by the job postings count from highest to lowest.

Hint
-Join job_postings_fact and company_dim on company_id to match jobs to companies.

-Use the WHERE clause to filter for jobs with job_health_insurance column.

-Use EXTRACT(QUARTER FROM job_posted_date) to filter for postings in the second quarter.

-Group results by company_name.

-Count the number of job postings per company with COUNT(job_id).

-Use HAVING to include only companies with at least one job posting.

-ORDER BY the job postings count in descending order to get highest → lowest.
*/






SELECT
    companies.name,
    COUNT(job_postings.job_id) AS count_posts
FROM 
    company_dim AS companies
LEFT JOIN 
    job_postings_fact AS job_postings
ON 
    companies.company_id = job_postings.company_id
WHERE
    job_postings.job_health_insurance = TRUE 
    AND EXTRACT(QUARTER FROM job_postings.job_posted_date) = 2
GROUP BY
    companies.name
HAVING
    COUNT(job_postings.job_id) >= 1
ORDER BY
    COUNT(job_postings.job_id) DESC;



SELECT
    companies.name,
    count(job_postings.job_id) as num_posts
FROM 
    company_dim AS companies
LEFT JOIN 
    job_postings_fact AS job_postings
ON 
    companies.company_id = job_postings.company_id
HAVING
    num_posts > 100






































