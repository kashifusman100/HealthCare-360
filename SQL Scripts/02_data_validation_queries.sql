-- HealthCare 360: Complete Galaxy Schema Table Creation & Staging Views

-- 1. DIMENSION TABLES

CREATE TABLE Dim_Date (
    DateKey INT PRIMARY KEY,
    FullDate DATE,
    Year INT,
    Quarter VARCHAR(5),
    MonthName VARCHAR(20),
    MonthNo INT
);

CREATE TABLE Dim_Facilities (
    FacilityID INT PRIMARY KEY,
    FacilityName VARCHAR(100),
    Region VARCHAR(50)
);

CREATE TABLE Dim_Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Dim_Providers (
    ProviderID INT PRIMARY KEY,
    ProviderName VARCHAR(100),
    Specialty VARCHAR(50)
);

CREATE TABLE Dim_Diagnosis (
    DiagnosisCode VARCHAR(10) PRIMARY KEY,
    DiagnosisDescription VARCHAR(100),
    Severity VARCHAR(20)
);

CREATE TABLE Dim_Procedures (
    ProcedureID INT PRIMARY KEY,
    ProcedureName VARCHAR(100),
    Category VARCHAR(50)
);

-- 2. FACT TABLES

CREATE TABLE Fact_Encounters (
    EncounterID INT PRIMARY KEY,
    PatientID INT,
    FacilityID INT,
    DepartmentID INT,
    ProviderID INT,
    DiagnosisCode VARCHAR(10),
    AdmissionDateKey INT,
    DischargeDateKey INT,
    LengthOfStay INT,
    ReadmittedFlag INT,
    FOREIGN KEY (FacilityID) REFERENCES Dim_Facilities(FacilityID),
    FOREIGN KEY (DepartmentID) REFERENCES Dim_Departments(DepartmentID),
    FOREIGN KEY (ProviderID) REFERENCES Dim_Providers(ProviderID),
    FOREIGN KEY (DiagnosisCode) REFERENCES Dim_Diagnosis(DiagnosisCode),
    FOREIGN KEY (AdmissionDateKey) REFERENCES Dim_Date(DateKey)
);

CREATE TABLE Fact_Billing (
    BillingID INT PRIMARY KEY,
    EncounterID INT,
    ProcedureID INT,
    PayerName VARCHAR(50),
    BilledAmount DECIMAL(10,2),
    PaidAmount DECIMAL(10,2),
    Status VARCHAR(20),
    FOREIGN KEY (EncounterID) REFERENCES Fact_Encounters(EncounterID),
    FOREIGN KEY (ProcedureID) REFERENCES Dim_Procedures(ProcedureID)
);

CREATE TABLE Fact_PatientFeedback (
    FeedbackID INT PRIMARY KEY,
    EncounterID INT,
    Rating INT,
    FeedbackDateKey INT,
    FOREIGN KEY (EncounterID) REFERENCES Fact_Encounters(EncounterID),
    FOREIGN KEY (FeedbackDateKey) REFERENCES Dim_Date(DateKey)
);

CREATE TABLE Fact_Vitals (
    VitalID INT PRIMARY KEY,
    EncounterID INT,
    SystolicBP INT,
    DiastolicBP INT,
    FOREIGN KEY (EncounterID) REFERENCES Fact_Encounters(EncounterID)
);

CREATE TABLE Fact_EquipmentUsage (
    UsageID INT PRIMARY KEY,
    FacilityID INT,
    EquipmentName VARCHAR(100),
    UsageHours DECIMAL(10,2),
    FOREIGN KEY (FacilityID) REFERENCES Dim_Facilities(FacilityID)
);

CREATE TABLE Fact_Staff (
    StaffID INT PRIMARY KEY,
    FacilityID INT,
    DepartmentID INT,
    StaffCount INT,
    FOREIGN KEY (FacilityID) REFERENCES Dim_Facilities(FacilityID),
    FOREIGN KEY (DepartmentID) REFERENCES Dim_Departments(DepartmentID)
);

-- 3. STAGING VIEW FOR CLEAN BILLING DATA

GO
CREATE VIEW vw_FactBilling_Clean AS
SELECT 
    BillingID,
    EncounterID,
    ProcedureID,
    PayerName,
    BilledAmount,
    COALESCE(PaidAmount, 0.00) AS PaidAmount,
    (BilledAmount - COALESCE(PaidAmount, 0.00)) AS OutstandingBalance,
    CASE 
        WHEN Status IS NULL OR Status = '' THEN 'Pending'
        ELSE Status 
    END AS CleanedStatus
FROM Fact_Billing;