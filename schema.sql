-- Doctor Table
CREATE TABLE doctor (
    ID INT PRIMARY KEY,
    FirstName CHAR(15),
    LastName CHAR(15),
    StreetAddress CHAR(45),
    City CHAR(30),
    State CHAR(2),
    ZipCode CHAR(5),
    PhoneNumber CHAR(10),
    EmailAddress CHAR(30),
    Salary DECIMAL(10,2)
);

-- Patient Table
CREATE TABLE patient (
    ID INT PRIMARY KEY,
    FirstName CHAR(15),
    LastName CHAR(15),
    Insurance_ID INT,
    PolicyNumber CHAR(30),
    HasMedicare CHAR(1),
    HasMedicaid CHAR(1),
    StreetAddress CHAR(30),
    StreetAddress2 CHAR(30),
    City CHAR(30),
    State CHAR(2),
    ZipCode CHAR(5),
    PhoneNumber CHAR(10),
    EmailAddress CHAR(30),
    DateOfBirth DATE,
    FOREIGN KEY (Insurance_ID) REFERENCES insurance(ID)
);

-- Insurance Table
CREATE TABLE insurance (
    ID INT PRIMARY KEY,
    CompanyName CHAR(50),
    StreetAddress CHAR(45),
    City CHAR(30),
    State CHAR(30),
    ZipCode CHAR(5),
    PhoneNumber CHAR(10),
    EmailAddress CHAR(30)
);

-- Appointment Table
CREATE TABLE appointment (
    ID INT PRIMARY KEY,
    Patient_ID INT,
    Doctor_ID INT,
    ScheduledTime DATETIME,
    Reason VARCHAR(100),
    FOREIGN KEY (Patient_ID) REFERENCES patient(ID),
    FOREIGN KEY (Doctor_ID) REFERENCES doctor(ID)
);

-- BillStatus Table
CREATE TABLE billstatus (
    ID INT PRIMARY KEY,
    BillStatus CHAR(30)
);

-- Bill Table
CREATE TABLE bill (
    ID INT PRIMARY KEY,
    DateDue DATETIME,
    Appointment_ID INT,
    BillStatus_ID INT,
    FOREIGN KEY (Appointment_ID) REFERENCES appointment(ID),
    FOREIGN KEY (BillStatus_ID) REFERENCES billstatus(ID)
);

-- Service Table
CREATE TABLE service (
    ID INT PRIMARY KEY,
    Name CHAR(30),
    Description CHAR(45),
    CurrentCharge DECIMAL(10,2)
);

-- Bill_Service Table (many-to-many between bill and service)
CREATE TABLE bill_service (
    Bill_ID INT,
    Service_ID INT,
    Amount DECIMAL(10,2),
    PRIMARY KEY (Bill_ID, Service_ID),
    FOREIGN KEY (Bill_ID) REFERENCES bill(ID),
    FOREIGN KEY (Service_ID) REFERENCES service(ID)
);

-- Payment Table
CREATE TABLE payment (
    ID INT PRIMARY KEY,
    Bill_ID INT,
    AmountPaid DECIMAL(10,2),
    DatePaid DATETIME,
    Patient_ID INT,
    Insurance_ID INT,
    FOREIGN KEY (Bill_ID) REFERENCES bill(ID),
    FOREIGN KEY (Patient_ID) REFERENCES patient(ID),
    FOREIGN KEY (Insurance_ID) REFERENCES insurance(ID)
);
