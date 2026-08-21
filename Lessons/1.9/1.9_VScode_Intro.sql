SELECT 
	job_id,
	job_title AS title,
	salary_year_avg AS salary
FROM
	job_postings_fact
WHERE 
    job_title LIKE '%Data Engineer%'
	AND salary IS NOT NULL
GROUP BY 
	job_id,
    job_title,
    salary; 