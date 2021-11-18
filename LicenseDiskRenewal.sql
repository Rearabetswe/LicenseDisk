CREATE TABLE private_owner_applicant(
   
   id UNIQUEIDENTIFIER DEFAULT(NEWID()) NOT NULL PRIMARY KEY,
   IdNumber CHAR(13)  NOT NULL,
   First_Name VARCHAR(50) NOT NULL,
   Last_Name VARCHAR(50) NOT NULL,
   Applicant_Address VARCHAR(100) NOT NULL,
   CellPhone_Number  VARCHAR(10)  NOT NULL,
   Email_Address VARCHAR(100)  NOT NULL,
   CONSTRAINT UNQ_private_owner_applicant UNIQUE(IdNumber, CellPhone_Number, Email_Address)
);

CREATE TABLE Organisation_Owner_Applicant(

  id UNIQUEIDENTIFIER DEFAULT(NEWID()) NOT NULL PRIMARY KEY,
  Org_Name VARCHAR(100) NOT NULL,
  Business_Reg_IDNO CHAR(8) NOT NULL,
  Organisation_Address VARCHAR(100) NOT NULL,
  Org_Email_Address VARCHAR(15) NOT NULL,
  Org_TelePhone VARCHAR(10) NOT NULL,
  CONSTRAINT UNQ_Organisation_Owner_Applicant UNIQUE(Org_Name, Business_Reg_IDNO,Org_Email_Address, Org_TelePhone)

);

CREATE TABLE Account_Profile(
   UserName UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
   Acc_First_Name VARCHAR(50) NOT NULL,
   Acc_Last_Name VARCHAR(50) NOT NULL,
   Acc_Email_Address VARCHAR(100) NOT NULL,
   [PassWord] VARCHAR(50) NOT NULL,
   Private_ApplicantID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES private_owner_applicant(id),
   Org_ApplicantID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Organisation_Owner_Applicant(id),
   CONSTRAINT UNQ_Account_Profile UNIQUE(Acc_Email_Address,UserName,[Password])

);

CREATE TABLE Vehicle(
     id UNIQUEIDENTIFIER DEFAULT(NEWID()) NOT NULL PRIMARY KEY,
	 Make VARCHAR(100) NOT NULL,
	 License_Number VARCHAR(8) NOT NULL,
	 Vehicle_Registration VARCHAR(7) NOT NULL,
	 Chassis_Number VARCHAR(17) NOT NULL,
	 OdoMeter_Reading VARCHAR(50) NOT NULL,
	 Private_ApplicantID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES private_owner_applicant(id),
     Org_ApplicantID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Organisation_Owner_Applicant(id),
	 CONSTRAINT UNQ_Vehicles UNIQUE(License_Number, Vehicle_Registration, Chassis_Number)
);

CREATE TABLE Payment(
   Payment_ID UNIQUEIDENTIFIER DEFAULT(NEWID()) NOT NULL PRIMARY KEY,
   Private_ApplicantID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES private_owner_applicant(id),
   Org_ApplicantID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Organisation_Owner_Applicant(id),
   PaymentDate DATE NOT NULL,
   Payment_Amount DECIMAL(19,4) NOT NULL,
   Payment_Description VARCHAR(100) NOT NULL,
);

CREATE TABLE Applications
(
    Reference_Num VARCHAR(10) NOT NULL PRIMARY KEY,
	Private_OwnerID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES private_owner_applicant(id),
	Org_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES  Organisation_Owner_Applicant(id),
	Vehicle_Reg UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Vehicle(id),
	Payment_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Payment(Payment_ID),

);
