/*
Question: What are the top paying skills for data engineers? 
- Find the median salary for each skill for data engineers.
- Focus on remote positions with specified salaries
- Include skill frequency to find both salary and demand.
- Why? Find our which skills are associated with the 
highest pay, and find how common those skills are.
*/
------------------------------------------------------------

SELECT 
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
    COUNT(jpf.*) AS demand_count
FROM
 job_postings_fact AS jpf
 INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE 
    jpf.job_title_short = 'Data Engineer' 
    AND jpf.job_work_from_home = TRUE
GROUP BY
    sd.skills
HAVING
    COUNT(jpf.*) > 100
ORDER BY
    median_salary DESC
LIMIT 25;

-------------------------------------------------------------

/*
Heres a breakdown of the top highest paying skills for Data Engineers:

Key Insights:
- Rust is the highest paying skill with a median salary of $210000 with a demand of 232
- Both golang and terraform have a median salary of $184000 with high demand (terraform: 3248, golang: 912)
- Other notable skills include:
    - Spring: $175500, demand: 364
    - Neo4j: $170000, demand: 277
    - Gdpr: $169616, demand: 582
    - Graphql: $167500, demand: 445
    - Mongo: $162250, demand: 265
    - Airflow: $ 150000, demand: 9996

Takeaway: while the very high paying skill (Rust) has less demand than major cloud
and data tools, most of the top-paying skills have both solid salaries and significant demand. 
This suggests that learning tools like Terraform, Golang, Spring, Neo4j, and especially core data engineering
tools (Airflow, Kubernetes) provides a strong balance between compensation and marketability.

┌────────────┬───────────────┬──────────────┐
│   skills   │ median_salary │ demand_count │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ rust       │      210000.0 │          232 │
│ terraform  │      184000.0 │         3248 │
│ golang     │      184000.0 │          912 │
│ spring     │      175500.0 │          364 │
│ neo4j      │      170000.0 │          277 │
│ gdpr       │      169616.0 │          582 │
│ zoom       │      168438.0 │          127 │
│ graphql    │      167500.0 │          445 │
│ mongo      │      162250.0 │          265 │
│ fastapi    │      157500.0 │          204 │
│ django     │      155000.0 │          265 │
│ bitbucket  │      155000.0 │          478 │
│ crystal    │      154224.0 │          129 │
│ atlassian  │      151500.0 │          249 │
│ c          │      151500.0 │          444 │
│ typescript │      151000.0 │          388 │
│ kubernetes │      150500.0 │         4202 │
│ node       │      150000.0 │          179 │
│ css        │      150000.0 │          262 │
│ ruby       │      150000.0 │          736 │
│ airflow    │      150000.0 │         9996 │
│ redis      │      149000.0 │          605 │
│ vmware     │      148798.0 │          136 │
│ ansible    │      148798.0 │          475 │
│ jupyter    │      147500.0 │          400 │
└────────────┴───────────────┴──────────────┘

*/