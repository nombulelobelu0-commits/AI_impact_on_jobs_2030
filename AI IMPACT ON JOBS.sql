SELECT * FROM ai_impact_on_jobs_portfolio.ai_impact_on_jobs_2030;

-- data cleaning by creating another table so we can edit
CREATE TABLE `ai_impact_on_jobs2` (
  `Employee_ID` text,
  `Job_Title` text,
  `Industry` text,
  `Country` text,
  `Education_Level` text,
  `Years_Experience` int DEFAULT NULL,
  `AI_Replacement_Risk` double DEFAULT NULL,
  `Future_Demand_Score` double DEFAULT NULL,
  `Remote_Work_Possibility` text,
  `Average_Salary_USD` int DEFAULT NULL,
  `Required_Skills` text,
  `Automation_Level` text,
  `Job_Growth_2030` int DEFAULT NULL,
  `Work_Hours_Per_Week` int DEFAULT NULL,
  `Company_Size` text,
  `AI_Tool_Usage` text,
  `Performance_Score` double DEFAULT NULL,
  `Upskilling_Needed` text,
  `Job_Satisfaction` double DEFAULT NULL,
  `Hiring_Trend_2026` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




-- inserting columns in the new table ai_impact_on_jobs2


INSERT INTO `ai_impact_on_jobs_portfolio`.`ai_impact_on_jobs2`
(`Employee_ID`,
`Job_Title`,
`Industry`,
`Country`,
`Education_Level`,
`Years_Experience`,
`AI_Replacement_Risk`,
`Future_Demand_Score`,
`Remote_Work_Possibility`,
`Average_Salary_USD`,
`Required_Skills`,
`Automation_Level`,
`Job_Growth_2030`,
`Work_Hours_Per_Week`,
`Company_Size`,
`AI_Tool_Usage`,
`Performance_Score`,
`Upskilling_Needed`,
`Job_Satisfaction`,
`Hiring_Trend_2026`)
SELECT `ai_impact_on_jobs_2030`.`Employee_ID`,
    `ai_impact_on_jobs_2030`.`Job_Title`,
    `ai_impact_on_jobs_2030`.`Industry`,
    `ai_impact_on_jobs_2030`.`Country`,
    `ai_impact_on_jobs_2030`.`Education_Level`,
    `ai_impact_on_jobs_2030`.`Years_Experience`,
    `ai_impact_on_jobs_2030`.`AI_Replacement_Risk`,
    `ai_impact_on_jobs_2030`.`Future_Demand_Score`,
    `ai_impact_on_jobs_2030`.`Remote_Work_Possibility`,
    `ai_impact_on_jobs_2030`.`Average_Salary_USD`,
    `ai_impact_on_jobs_2030`.`Required_Skills`,
    `ai_impact_on_jobs_2030`.`Automation_Level`,
    `ai_impact_on_jobs_2030`.`Job_Growth_2030`,
    `ai_impact_on_jobs_2030`.`Work_Hours_Per_Week`,
    `ai_impact_on_jobs_2030`.`Company_Size`,
    `ai_impact_on_jobs_2030`.`AI_Tool_Usage`,
    `ai_impact_on_jobs_2030`.`Performance_Score`,
    `ai_impact_on_jobs_2030`.`Upskilling_Needed`,
    `ai_impact_on_jobs_2030`.`Job_Satisfaction`,
    `ai_impact_on_jobs_2030`.`Hiring_Trend_2026`
FROM `ai_impact_on_jobs_portfolio`.`ai_impact_on_jobs_2030`;

select *
from ai_impact_on_jobs2;

-- there are some columns that need to be romoved 

alter table ai_impact_on_jobs2
Drop column `Required_Skills`;

-- check duplicates using CTE

With duplicate_CTE as
( 
select *,
Row_number() Over( partition by `Employee_ID`,
`Job_Title`,
`Industry`,
`Country`,
`Education_Level`,
`Years_Experience`,
`AI_Replacement_Risk`,
`Future_Demand_Score`,
`Remote_Work_Possibility`,
`Average_Salary_USD`,
`Automation_Level`,
`Job_Growth_2030`,
`Work_Hours_Per_Week`,
`Company_Size`,
`AI_Tool_Usage`,
`Performance_Score`,
`Upskilling_Needed`,
`Job_Satisfaction`,
`Hiring_Trend_2026`)
As Row_num from ai_impact_on_jobs2 
)

select *
from duplicate_CTE
where Row_num > 1 ;

-- data cleaning done

-- Second step now is to build Strategic Business Intelligence Reports

-- AI Risk Assessment vs. Salary
Select AI_Replacement_Risk ,Average_Salary_USD
from ai_impact_on_jobs2
order by Average_Salary_USD Desc
limit 5 ;
-- here i Identified  which top 5 high-paying roles (Average_Salary_USD) face the highest risk of replacement (AI_Replacement_Risk).

-- Upskilling Priority Matrix
-- Group data by Industry and Country to find where Upskilling_Needed is 'Yes' alongside low Job_Satisfaction and high Automation_Level.

 Select Industry, Country, Upskilling_Needed , job_Satisfaction , Automation_Level
 from ai_impact_on_jobs2
 where Upskilling_Needed = "Yes"
 and job_Satisfaction < 3.00
 and Automation_Level = "High"
 order by job_Satisfaction asc
 limit 5;
 -- you are looking at which industries have an unhappy workforce that is completely unprotected against the oncoming wave of AI.
 -- Does looking at job satisfaction as a metric for "human readiness to leave or adapt" make it click a bit better?
 select *
 from ai_impact_on_jobs2;
 
--  Hiring Trend Analytics: 
 -- aggregate queries utilizing GROUP BY to compare Hiring_Trend_2026 against projected Job_Growth_2030 
 -- to see which fields are short-term spikes vs. long-term stable careers.
 
 SELECT 
    Hiring_Trend_2026,
    AVG(Job_Growth_2030) AS Average_Long_Term_Growth,
    COUNT(*) AS Number_of_Jobs
FROM ai_impact_on_jobs2
GROUP BY Hiring_Trend_2026
ORDER BY Average_Long_Term_Growth DESC;


--  TOP 5 FASTEST-GROWING JOBS PER COUNTRY
-- Purpose: Calculates the top 5 highest-growth roles isolated by country
-- using advanced window functions for clean visualization reporting.


WITH RankedJobs AS (
    SELECT 
        Country,
        Job_Title,
        Industry,
        Job_Growth_2030,
        -- This calculates the rank independently for each unique country group
        ROW_NUMBER() OVER (
            PARTITION BY Country 
            ORDER BY Job_Growth_2030 DESC
        ) AS Growth_Rank
    FROM ai_impact_on_jobs2
)
-- Filter the temporary table to only return the top 5 positions per country
SELECT 
    Country,
    Growth_Rank,
    Job_Title,
    Industry,
    Job_Growth_2030
FROM RankedJobs
WHERE Growth_Rank <= 5
ORDER BY Country ASC, Growth_Rank asc;

--  High Salary, Low AI Replacement Risk, and High Job Growth.
-- Purpose: Identifies high-paying, safe, and rapidly growing career paths.


SELECT 
    Job_Title,
    Industry,
    Country,
    Average_Salary_USD,
    AI_Replacement_Risk,
    Job_Growth_2030,
    Hiring_Trend_2026
FROM ai_impact_on_jobs_2030  
WHERE Average_Salary_USD > 100000      -- Rule 1: High Salary (Six figures)
  AND AI_Replacement_Risk < 0.30       -- Rule 2: Low AI Risk (Under 30% risk score)
  AND Job_Growth_2030 > 15             -- Rule 3: High Future Growth (Over 15% growth rate)
ORDER BY Average_Salary_USD DESC;      -- Puts the richest  at the very top

















 
 









