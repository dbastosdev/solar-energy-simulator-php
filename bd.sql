CREATE TABLE Clients (
    ClientId INT NOT NULL AUTO_INCREMENT, 
    ClientName VARCHAR(20),
    ClientLastName VARCHAR(20),
    ClientEmail VARCHAR(50),
    ClientPhone VARCHAR(20),
    ClientLogin VARCHAR(40),
    ClientPassword VARCHAR(40)
); 

CREATE TABLE ClientsLogin (
    LoginId INT NOT NULL AUTO_INCREMENT, 
    ClientId INT,
    LoginHash VARCHAR(40),
    LoginLimitDate DATA,
    PRIMARY KEY (LoginId),
    FOREIGN KEY (ClientId) REFERENCES Clients(ClientId)
); 

CREATE TABLE Properties (
    PropertieId INT NOT NULL AUTO_INCREMENT, 
    ClientId INT,
    PropertieAdress VARCHAR(50),
    PropertieNumber INT(5),
    PropertieCitie VARCHAR(50),
    PropertieState VARCHAR(50),
    PropertieCountry VARCHAR(50),
    PropertieCep VARCHAR(10),
    PropertieType VARCHAR(10),
    PropertieArea FLOAT(5,2),
    PRIMARY KEY (PropertieId),
    FOREIGN KEY (ClientId) REFERENCES Clients(ClientId)
); 

CREATE TABLE Invoices (
    InvoiceId INT NOT NULL AUTO_INCREMENT, 
    PropertieId INT,
    InvoiceName VARCHAR(40),
    InvoicePath VARCHAR(200),
    PRIMARY KEY (InvoiceId),
    FOREIGN KEY (PropertieId) REFERENCES Properties(PropertieId)
);

CREATE TABLE Simulations (
    SimulationId INT NOT NULL AUTO_INCREMENT, 
    ClientId INT,
    PropertieId INT,
    SolarDataId INT,
    SimulationAvgConsumption FLOAT(5,2),
    SimulationAvgPrice FLOAT(5,2),
    SimulationMeter VARCHAR(10),
    PRIMARY KEY (SimulationId),
    FOREIGN KEY (ClientId) REFERENCES Clients(ClientId),
    FOREIGN KEY (PropertieId) REFERENCES Properties(PropertieId),
    FOREIGN KEY (SolarDataId) REFERENCES SolarDatas(SolarDataId)
);

CREATE TABLE SolarDatas (
    SolarDataId INT NOT NULL AUTO_INCREMENT, 
    SolarDataCitie VARCHAR(40),
    SolarDataJan FLOAT(3,2),
    SolarDataFev FLOAT(3,2),
    SolarDataMar FLOAT(3,2),
    SolarDataAbr FLOAT(3,2),
    SolarDataMai FLOAT(3,2),
    SolarDataJun FLOAT(3,2),
    SolarDataJul FLOAT(3,2),
    SolarDataAgo FLOAT(3,2),
    SolarDataSet FLOAT(3,2),
    SolarDataOut FLOAT(3,2),
    SolarDataNov FLOAT(3,2),
    SolarDataDez FLOAT(3,2),
    SolarDataAvg FLOAT(3,2),
    SolarDataMax FLOAT(3,2),
    SolarDataMin FLOAT(3,2),
);

CREATE TABLE LogsLogin (
    LogLoginId INT NOT NULL AUTO_INCREMENT, 
    ClientId INT,
    LogLoginIp VARCHAR(20),
    LogLoginEmail VARCHAR(50),
    LogLoginData DATE,
    LogLoginAction VARCHAR(100),
    PRIMARY KEY (LogLoginId),
    FOREIGN KEY (ClientId) REFERENCES Clients(ClientId)
);