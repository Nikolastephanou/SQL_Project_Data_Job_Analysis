/*
Question:What are the most optimal skills to learn (aka it’s a high demand and a high-paying skill) for a data analyst?** 

- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), offering strategic insights for career development in data analysis
*/

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    count(skills_job_dim.job_id) as demand_count,
    ROUND(avg(salary_year_avg), 0) as avg_salary
FROM
    job_postings_fact
INNER JOIN
      skills_job_dim
ON
    skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN
    skills_dim
ON
    skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id
HAVING
    count(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT
    25;


SELECT
    skills_dim.skills,
    COUNT(job_postings_fact.job_id) as job_count
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim
ON
    skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN
    skills_dim
ON
    skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short IN ('Business Analyst', 'Data Analyst')
GROUP BY
    skills_dim.skill_id
ORDER BY
    job_count DESC;



