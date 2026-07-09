# AI_impact_on_jobs_2030
End-to-end data analytics project using SQL, Excel, and Power BI to analyse AI's impact on jobs by 2030.

## Project Overview

This project analyses how artificial intelligence is expected to impact the job market by 2030. Using SQL, Excel, and Power BI, the data was cleaned, transformed, analysed, and visualised to identify which jobs, industries, countries, education levels, and workforce characteristics are most exposed to AI replacement.

The dashboard is designed to answer key business questions and help identify areas where reskilling and workforce planning may become increasingly important.

## Tools Used
SQL (MySQL Workbench) – Data cleaning and business analysis
Microsoft Excel – Data transformation, categorisation, formulas, and Pivot Tables
Power BI – Interactive dashboard development and data visualisation

## Data Preparation (SQL)

To preserve the original dataset, a working copy was created before any cleaning was performed.

The data preparation process included:

Creating a duplicate working table
Removing unnecessary columns
Checking for duplicate records using window functions
Preparing the dataset for analysis and reporting

## SQL Business Analysis
SQL queries were written to answer key business questions, including:

-Relationship between AI replacement risk and salary
-Industries with the greatest upskilling needs
-Hiring trends compared with future job growth
-Top five fastest-growing jobs in each country
-High-paying jobs with low AI replacement risk and strong future demand

## Excel Analysis
Tasks completed included:

Converting text values into numeric values
Categorising AI replacement risk into Low, Medium, and High
Categorising Future Demand into Low, Average, and High

Creating Pivot Tables to summarise the data by:
-Job title
-Industry
-Country
-Education level
-Automation level
-Hiring trends

## Power BI Dashboard
The dashboard provides an interactive view of the data using:

KPI Cards
Clustered Column Charts
Clustered Bar Charts
Pie Charts
Interactive Slicers

The dashboard answers questions such as:

-Which jobs are most at risk of AI replacement?
-Which jobs are least at risk?
-Which industries face the highest AI replacement risk?
-Does education reduce AI replacement risk?
-How does automation relate to AI replacement risk?
-Which countries show the highest replacement risk?
-Does upskilling appear to reduce AI replacement risk?
-DAX Measures
The following measures were created in Power BI to power the KPI cards and visuals:
-Total Headcount
-Average Salary
-Average Job Satisfaction
-AI Replacement Risk (%)
-Future Demand Score (%)
 

## Key Insights

**Highest vs Lowest Risk Jobs*
The gap between the riskiest and safest jobs isn't as dramatic as expected — DevOps Engineer tops the list at 57% risk, while Data Scientist and Business Analyst sit at the bottom around 47%. That's only a 10 point spread across the entire job market, showing AI risk is fairly widespread rather than concentrated in a few roles. Teacher also appears in the top 5 highest risk at 52%, alongside technical roles like Cloud Architect and IoT Specialist — this isn't just a tech-jobs problem.

**Industry Breakdown*
Finance and Government tie for the highest industry risk at 53%, with Technology close behind at 52%. Healthcare comes in lowest at 48%. The spread is tight, reinforcing that no industry is fully safe from AI's reach, some are just slightly more exposed than others.

**Country Breakdown*
Pakistan leads at 53% risk, with most other countries clustered tightly around 50-51%. Singapore is the clear outlier on the low end at 48%. This is a genuinely global pattern, not something isolated to one region.

**Education Level*
Risk is essentially split evenly across Bachelor's, Master's, PhD, and High School education levels, each holding almost exactly a quarter of the total risk share. Getting a higher degree doesn't meaningfully protect against AI replacement risk in this dataset.

**Automation Level*
Risk is fairly evenly distributed here too — High automation jobs carry 34% of total risk, Low automation carries 33%, and Medium sits at 33%. Automation level alone isn't the deciding factor in replacement risk.

**Upskilling Needed*
Almost a perfect 50/50 split between jobs flagged as needing upskilling and those that aren't — meaning half the workforce in this dataset is already being signalled to develop new skills to stay relevant.

**Overall Headline Numbers*
Across the full dataset of 3,000 employees, average replacement risk sits right at 50%, with an average salary of $126.64K, average job satisfaction of just 3.03, and an average of 12 years of experience.


## Conclusion

The analysis shows that AI replacement risk in this dataset is widespread rather than concentrated — no single job, industry, country, or education level stands out as dramatically safer or more exposed than another. This suggests that AI disruption is a broad, structural shift affecting the workforce as a whole, rather than a threat isolated to specific technical roles or lower education levels. With job satisfaction averaging just above the midpoint and half the workforce already flagged as needing upskilling, the data points toward a workforce that is only moderately prepared for the scale of change AI is expected to bring by 2030.


📁 Repository Contents
AI_IMPACT_ON_JOBS.sql – SQL data cleaning and business analysis
AI_Impact_on_Jobs_2030_.xlsx – Excel workbook containing formulas, categorisation, and Pivot Tables
POWER_BI_DASHBOARD.pbix – Interactive Power BI dashboard
README.md – Project documentation

👤 Author

Nombulelo Belu

BCom Economic Science with Econometrics Graduate

Aspiring Data Analyst
