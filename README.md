# HealthCare-360

## Project Description
HealthCare 360 is an end-to-end Power BI dashboard built to give hospital executives a complete view of clinical operations, revenue cycles, patient sentiment, and asset management. The raw healthcare data was processed through various ETL steps in Power Query to prepare the data for analysis. I built a robust Galaxy Schema data model connecting multiple fact tables to shared dimension tables using 1-to-Many, single-direction relationships. Finally, I created custom DAX measures to calculate financial metrics, readmission rates, and patient satisfaction across a clean, multi-page interactive dashboard.

## Identified Business Challenges
Hospital managers need a central system to track revenue collection, patient care quality, and resource usage across multiple facilities.

- Revenue Cycle Bottlenecks: Where is billed revenue getting stuck, and which insurance payers have the highest claim rejection rates?
- Clinical Readmission Risks: Which specific medical conditions drive high repeat hospital visits and longer patient stays?
- Patient Satisfaction Drivers: What departments or diagnoses correlate with lower patient survey ratings?
- Workforce & Asset Allocation: How are medical equipment usage hours and provider revenue distributed across hospital locations and specialties?
- Data Modeling Structure: How can separate clinical, financial, and feedback tables be modeled cleanly without causing relationship loops or broken calculations?

## Tools Used
Power BI Desktop (Power Query, Data Modeling, DAX), Excel (source data)

## Links
[Dashboard Screenshots](https://github.com/kashifusman100/HealthCare-360/tree/main/Dashboard%20Screenshots)

[Power BI File](https://github.com/kashifusman100/HealthCare-360/tree/main/Power%20BI%20File)

## Quick Dashboard Demo
https://github.com/user-attachments/assets/bf339c73-ad46-48c2-addb-93023ffcad87

## Model View
<img width="1558" height="683" alt="Image" src="https://github.com/user-attachments/assets/aee1bdef-586b-4c34-995a-df1aa7b5282d" />

## Key Insights & Findings

- Overall Performance: The hospital system recorded 6,000 total encounters generating $10.56M in total revenue, maintaining an average length of stay of 2.56 days and an overall readmission rate of 8.91%.
- Financial Revenue Cycle: Out of $10.56M billed, $6.34M has been collected, $4.21M remains outstanding, and $1.01M was lost to rejected claims—resulting in a high 10.47% overall claim rejection rate heavily impacted by Medicare and UnitedHealth.
- Readmission Drivers: Chronic and respiratory diagnoses had the highest readmission rates, led by Asthma (11.36%), Depression (11%), and Sepsis (10.38%).
- Patient Satisfaction: Overall patient satisfaction sits at an average of 3.73 out of 5, with 4-star ratings (1,547) and 5-star ratings (1,112) making up the majority of survey feedback.
- Facility & Specialty Revenue: North Clinic generated the highest revenue ($2.24M) among facilities, while General Practice ($1.93M) and Orthopedics ($1.76M) were the top earning specialties.
- Equipment Usage: X-Ray Machines (1,148 hours), Infusion Pumps (1,066 hours), and Ultrasound Machines (1,035 hours) logged the highest total usage across all branches.
