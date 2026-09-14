-- HealthCare 360: Database Schema & Staging Views
-- Demonstrates backend table creation and SQL-level data cleaning

-- 1. Dimension Tables
CREATE TABLE Dim_Facilities (
    FacilityID INT PRIMARY KEY,
    FacilityName VARCHAR(100),
    Region VARCHAR(50)
);

CREATE TABLE Dim_Diagnosis (
    DiagnosisCode VARCHAR(10) PRIMARY KEY,
    DiagnosisDescription VARCHAR(100),
    Severity VARCHAR(20)
);

CREATE TABLE Dim_Providers (
    ProviderID INT PRIMARY KEY,
    ProviderName VARCHAR(100),
    Specialty VARCHAR(50)
);

-- 2. Fact Tables
CREATE TABLE Fact_Encounters (
    EncounterID INT PRIMARY KEY,
    PatientID INT,
    FacilityID INT,
    DiagnosisCode VARCHAR(10),
    ProviderID INT,
    AdmissionDate DATE,
    DischargeDate DATE,
    LengthOfStay INT,
    ReadmittedFlag INT,
    FOREIGN KEY (FacilityID) REFERENCES Dim_Facilities(FacilityID),
    FOREIGN KEY (DiagnosisCode) REFERENCES Dim_Diagnosis(DiagnosisCode),
    FOREIGN KEY (ProviderID) REFERENCES Dim_Providers(ProviderID)
);

CREATE TABLE Fact_Billing (
    BillingID INT PRIMARY KEY,
    EncounterID INT,
    PayerName VARCHAR(50),
    BilledAmount DECIMAL(10,2),
    PaidAmount DECIMAL(10,2),
    Status VARCHAR(20),
    FOREIGN KEY (EncounterID) REFERENCES Fact_Encounters(EncounterID)
);

-- 3. Database Cleaning View (Pre-ingestion Layer)
-- Cleans null status values and calculates outstanding balance at database level
GO
CREATE VIEW vw_FactBilling_Clean AS
SELECT 
    BillingID,
    EncounterID,
    PayerName,
    BilledAmount,
    COALESCE(PaidAmount, 0.00) AS PaidAmount,
    (BilledAmount - COALESCE(PaidAmount, 0.00)) AS OutstandingBalance,
    CASE 
        WHEN Status IS NULL OR Status = '' THEN 'Pending'
        ELSE Status 
    END AS CleanedStatus
FROM Fact_Billing;