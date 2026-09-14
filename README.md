# HealthCare-360

## Project Description
HealthCare 360 is a 4 page Power BI dashboard built to track hospital operations, revenue collection, clinical quality, and equipment usage across multiple facilities. 

I used SQL to set up database tables, clean raw records, and validate key financial and clinical metrics against database logic. In Power Query, I handled data type formatting, cleaned messy strings, and merged missing lookup keys. The data model uses a Galaxy Schema with single direction 1 to Many relationships to prevent circular dependencies and maintain fast visual performance. Custom DAX measures were written to handle financial reconciliation, readmission rates, and patient feedback scores.

## Identified Business Challenges
Hospital managers need a central system to track revenue collection, patient care quality, and resource usage across multiple facilities.

- **Revenue Cycle Bottlenecks:** Where is billed revenue getting stuck, and which insurance payers have the highest claim rejection rates?
- **Clinical Readmission Risks:** Which specific medical conditions drive high repeat hospital visits and longer patient stays?
- **Patient Satisfaction Drivers:** What departments or diagnoses correlate with lower patient survey ratings?
- **Workforce & Asset Allocation:** How are medical equipment usage hours and provider revenue distributed across hospital locations and specialties?
- **Data Modeling Structure:** How can separate clinical, financial, and feedback tables be modeled cleanly without causing relationship loops or broken calculations?

## Tools Used

**Power BI Desktop:** Power Query ETL, Galaxy Schema Modeling, DAX Measures, Visuals

**SQL:** Table creation (DDL), data cleaning, and metric validation queries

**Excel / CSV:** Source dataset files

## Links
[Dashboard Screenshots](https://github.com/kashifusman100/HealthCare-360/tree/main/Dashboard%20Screenshots)

[Power BI File](https://github.com/kashifusman100/HealthCare-360/tree/main/Power%20BI%20File)

[SQL Scripts](https://github.com/kashifusman100/HealthCare-360/tree/main/SQL%20Scripts)

## Quick Dashboard Demo
https://github.com/user-attachments/assets/bf339c73-ad46-48c2-addb-93023ffcad87

## Model View
<img width="1558" height="683" alt="Image" src="https://github.com/user-attachments/assets/aee1bdef-586b-4c34-995a-df1aa7b5282d" />

## Key Insights & Findings

- **Overall Performance:** The hospital system recorded 6,000 total encounters generating $10.5M in total revenue, maintaining an average length of stay of 2.5 days and an overall readmission rate of 8.91%.
- **Financial Revenue Cycle:** Out of $10.5M billed, $6.3M has been collected, $4.2M remains outstanding, and $1M was lost to rejected claims resulting in a high 10.5% overall claim rejection rate heavily impacted by Medicare and UnitedHealth.
- **Readmission Drivers:** Chronic and respiratory diagnoses had the highest readmission rates, led by Asthma (11.3%), Depression (11%), and Sepsis (10.3%).
- **Patient Satisfaction:** Overall patient satisfaction sits at an average of 3.73 out of 5, with 4 star ratings (1,547) and 5 star ratings (1,112) making up the majority of survey feedback.
- **Facility & Specialty Revenue:** North Clinic generated the highest revenue ($2.24M) among facilities, while General Practice ($1.93M) and Orthopedics ($1.76M) were the top earning specialties.
- **Equipment Usage:** X-Ray Machines (1,148 hours), Infusion Pumps (1,066 hours), and Ultrasound Machines (1,035 hours) logged the highest total usage across all branches.
