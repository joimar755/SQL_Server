/*
USE Joimar_DIU;
USE Joimar_DIU;

CREATE TABLE TypeUser(
  TypeUserId int IDENTITY(1,1) PRIMARY KEY not null, 
  Description VARCHAR(100) not null,
  Active bit DEFAULT ((1)) not null,
)
CREATE TABLE Users(
   UsersId int IDENTITY(1,1) PRIMARY KEY not null, 
   FirstName VARCHAR(100) not null,
   LastName VARCHAR(100) not null,
   DoB date DEFAULT(getdate()) not null,
   PhoneNumber int, 
   Email VARCHAR(100),
   TypeUserId int not null,
   AddedOn date DEFAULT(getdate()) not null, 
   Modified date DEFAULT(getdate()) not null, 
   Active bit DEFAULT ((1)) not null, 
   FOREIGN KEY (TypeUserId) REFERENCES TypeUser(TypeUserId)
)
CREATE TABLE TypeTravel(
  TypeTravelId int IDENTITY(1,1) PRIMARY KEY not null, 
  Description VARCHAR(100) not null,
  AddedOn date DEFAULT(getdate()) not null, 
  Modified date DEFAULT(getdate()) not null, 
  Active bit DEFAULT ((1)) not null
)
CREATE TABLE Providers(
  ProvidersId int IDENTITY(1,1) PRIMARY KEY not null,
  Description VARCHAR(100) not null,
  StreetAddress VARCHAR(100) not null,
  PhoneNumber int,
  ContactName VARCHAR(100),
  Email VARCHAR(100),
  AddedOn date DEFAULT(getdate()) not null,
  Modified date DEFAULT(getdate()) not null,
  Active bit DEFAULT ((1)) not null,
) 
CREATE TABLE Driver(
  DriverId int IDENTITY(1,1) PRIMARY KEY not null,
  DriverLicence VARCHAR(100) not null,
  LicenceExpired date DEFAULT(getdate()) not null,
  ProvidersId int not null,
  UsersId int not null,
  AddedOn date DEFAULT(getdate()) not null,
  Modified date DEFAULT(getdate()) not null,
  Active bit DEFAULT ((1)) not null,
  FOREIGN KEY (ProvidersId) REFERENCES  Providers(ProvidersId),
  FOREIGN KEY (DriverId) REFERENCES  Users(UsersId)
  
)
CREATE TABLE Insurence(
  InsurenceId int IDENTITY(1,1) PRIMARY KEY not null,
  Description VARCHAR(100) not null,
  StreetAddress VARCHAR(100),
  PhoneNumber int,
  ContactName VARCHAR(100),
  AddedOn date DEFAULT(getdate()) not null,
  Modified date DEFAULT(getdate()) not null,
  Active bit DEFAULT ((1)) not null
)
CREATE TABLE Plans(
  PlansId int IDENTITY(1,1) PRIMARY KEY not null,
  Description VARCHAR(100) not null,
  InsurenceId int not null,
  AddedOn date DEFAULT(getdate()) not null,
  Modified date DEFAULT(getdate()) not null,
  Active bit DEFAULT ((1)) not null
  FOREIGN KEY (InsurenceId) REFERENCES Insurence(InsurenceId)
)
CREATE TABLE Patient(
   PatientId int IDENTITY(1,1) PRIMARY KEY not null,
   FirstName VARCHAR(100) not null,
   LastName VARCHAR(100) not null,
   DoB date default (getdate()) not null,
   Identification int  not null,
   StreetAddress VARCHAR(100),
   PhoneNumber int,
   Email VARCHAR(100),
   Plans VARCHAR(100),
   Gender VARCHAR(100),
   AddedOn date DEFAULT(getdate()) not null,
   Modified date DEFAULT(getdate()) not null,
   Active bit DEFAULT ((1)) not null  
)
CREATE TABLE TravelStatus(
   TravelStatusId int IDENTITY(1,1) PRIMARY KEY not null,
   Description  VARCHAR(100) not null,
   AddedOn date DEFAULT(getdate()) not null,
   Modified date DEFAULT(getdate()) not null,
   Active bit DEFAULT ((1)) not null  
)
CREATE TABLE TravelSchedule(
  TravelScheduleId int IDENTITY(1,1) PRIMARY KEY not null,
  DataService date DEFAULT(getdate()) not null,
  TravelStatusId int not null,
  TotalKM int not null,
  InsurenceId int not null,
  ProvidersId int not null,
  PatientId int not null,  
  TypeTravelId int not null,
  UsersId int not null,
  VehicleId int not null,
  PUStreetAddress VARCHAR(100),
  ArrivelStreetAddress VARCHAR(100),
  ScheduleTime  date default (getdate()) not null,
  Appointment VARCHAR(100),
  PickupTime date default (getdate()) not null,
  ArrivalTime date default (getdate()) not null,
  ReasonTransport VARCHAR(100),
  AddedOn date DEFAULT(getdate()) not null,
  Modified date DEFAULT(getdate()) not null,
  Active bit DEFAULT ((1)) not null, 
  DriverId int not null,
  TotalTravel decimal, 
  FOREIGN KEY (TravelStatusId) REFERENCES TravelStatus(TravelStatusId),
  FOREIGN KEY (InsurenceId) REFERENCES Insurence(InsurenceId),
  FOREIGN KEY (ProvidersId) REFERENCES Providers(ProvidersId),
  FOREIGN KEY (PatientId) REFERENCES Patient(PatientId),
  FOREIGN KEY (TypeTravelId) REFERENCES TypeTravel(TypeTravelId),
  FOREIGN KEY (UsersId) REFERENCES Users(UsersId),
  FOREIGN KEY (DriverId) REFERENCES Driver(DriverId)
)
-- CAMBIAR EL TIPO DE DATO Y LA FECHA
ALTER TABLE TravelSchedule ALTER COLUMN TotalTravel DECIMAL(10,0);
ALTER TABLE Users ALTER COLUMN DoB DATE not null;
*/ 
/*
ALTER TABLE Driver 
ADD CONSTRAINT FK_Driver_Users 
FOREIGN KEY (UsersId) REFERENCES Users(UsersId);
*/
ALTER TABLE Driver ALTER COLUMN LicenceExpired date not null
-- Añadir Relacion de las dos primary key
ALTER TABLE Driver 
ADD FOREIGN KEY (DriverId) REFERENCES  Users(UsersId)

--insert 
/* 
INSERT TypeUser(Description) values ('Admin'),('Driver');

*/


