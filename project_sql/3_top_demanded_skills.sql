/*
Question: What are the most in-demand skills for data analysts?**

- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, providing insights into the most valuable skills for job seekers.
*/


SELECT
    skills,
    count(skills_job_dim.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;


SELECT
    job_postings_fact.job_location as job_location,
    company_dim.name as company_name,
    skills_dim.skills,
    job_postings_fact.salary_year_avg as average_annual_salary
FROM
    job_postings_fact
INNER JOIN
    company_dim
ON
    company_dim.company_id = job_postings_fact.company_id
INNER JOIN
    skills_job_dim
ON
    skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN
    skills_dim
ON
    skills_dim.skill_id = skills_job_dim.skill_id
where
    job_title_short = 'Data Analyst' and
    job_country = 'Cyprus' AND
    job_location like '%Limassol%';








