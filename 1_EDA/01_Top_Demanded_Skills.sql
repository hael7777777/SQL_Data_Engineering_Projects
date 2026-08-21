/*
Question: what are the most demanded skills for data engineers?
- Identify the top 15 most demanded skills for data engineers.
- Focus on remote job postings.
- Why? Retrieves the top 15 skills with the highest demand in the remote job market,
providing insights into the most valuable skills for data engineers seeking remote work.
*/
---------------------------------------------------

SELECT 
    sd.skills,
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
ORDER BY
    demand_count DESC
LIMIT 15;

--------------------------------------------------
/*
This is a break down of the top 15 highest demanded skills for data engineers:
SQL is the highest demanded skill with 29,221 job postings, the Python with 28,776 job postings.
The next few skills are cloud based technologies such as AWS, Azure, and Spark,
Which indicates the importance of cloud computing for big data handeling and processing.

Key takeaways:
- SQL and Python are fundemental skills for data engineers which act as the foundation for data manipulation and analysis
- Cloud computing skills such as AWS, Azure, and Spark are highly demanded, highlighting the need for data engineers to be proficient in cloud platforms for big data processing in modern times
- Spark indicates the indicates the need for big data skills
- Airflow, Snowflake, and Databricks are also in high demand, which suggests that data engineers should be profiecient with data pipeline tools
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
│ kafka      │         6415 │
│ scala      │         6304 │
│ redshift   │         5737 │
│ hadoop     │         5447 │
│ pyspark    │         4898 │
└────────────┴──────────────┘
*/

