-- HealthCare 360: Business Metric Validation Queries
-- Used to verify database numbers against Power BI DAX outputs

-- 1. Validate Total Billed, Collected, Outstanding, and Rejection Rate
SELECT 
    SUM(BilledAmount) AS Total_Billed_Revenue,
    SUM(PaidAmount) AS Total_Paid_Collected,
    SUM(BilledAmount - PaidAmount) AS Outstanding_Balance,
    ROUND(
        SUM(CASE WHEN Status = 'Rejected' THEN 1.0 ELSE 0.0 END) / COUNT(BillingID) * 100, 2
    ) AS Rejection_Rate_Pct
FROM Fact_Billing;

-- 2. Validate Readmission Rate % by Diagnosis
SELECT 
    d.DiagnosisDescription,
    COUNT(e.EncounterID) AS Total_Encounters,
    SUM(e.ReadmittedFlag) AS Total_Readmissions,
    ROUND(SUM(e.ReadmittedFlag) * 100.0 / COUNT(e.EncounterID), 2) AS Readmission_Rate_Pct
FROM Fact_Encounters e
JOIN Dim_Diagnosis d ON e.DiagnosisCode = d.DiagnosisCode
GROUP BY d.DiagnosisDescription
ORDER BY Readmission_Rate_Pct DESC;

-- 3. Validate Revenue across Specialties
SELECT 
    p.Specialty,
    SUM(b.BilledAmount) AS Billed_Revenue
FROM Fact_Billing b
JOIN Fact_Encounters e ON b.EncounterID = e.EncounterID
JOIN Dim_Providers p ON e.ProviderID = p.ProviderID
GROUP BY p.Specialty
ORDER BY Billed_Revenue DESC;