-- we create the DB
CREATE DATABASE Bolt_Food;
GO

-- we enter it
USE Bolt_Food;
GO

CREATE TABLE Tip_Vehicul(
Denumire nvarchar(100) PRIMARY KEY,
Tonaj INT DEFAULT 1
);

CREATE TABLE Card_(
Id_Card INT PRIMARY KEY IDENTITY,
Companie nvarchar(100) NOT NULL,
Denumire nvarchar(100) NOT NULL,
Cod_plata varchar(16) NOT NULL,
Tip nvarchar(100) NOT NULL,
Data_De_Expirare DATE NOT NULL,
);

CREATE TABLE Adresa(
Id_Adresa INT PRIMARY KEY IDENTITY,
Tara nvarchar(100) NOT NULL,
Cod_Postal varchar(6)  NOT NULL,
Strada nvarchar(100) NOT NULL,
Numar int,
Nr_apartament int,
-- CONSTRAINT pk_adr PRIMARY KEY (Tara, Cod_Postal, Strada, Numar, Nr_apartament) -- IDKKKKKKK
);

CREATE TABLE Meniu(
Id_Meniu INT PRIMARY KEY IDENTITY,
Url_site nvarchar(100),
);

CREATE TABLE Bauturi(
Id_Bautura INT PRIMARY KEY IDENTITY,
Id_Meniu INT FOREIGN KEY REFERENCES Meniu(Id_Meniu),
Cantitate FLOAT DEFAULT 0,
Denumire nvarchar(100) NOT NULL,
Pret FLOAT DEFAULT 0,
Descriere nvarchar(1000)
);

CREATE TABLE Fel_De_Mancare(
Id_Mancare INT PRIMARY KEY IDENTITY,
Id_Meniu INT FOREIGN KEY REFERENCES Meniu(Id_Meniu),
Cantitate FLOAT DEFAULT 0,
Denumire nvarchar(100) NOT NULL,
Pret FLOAT DEFAULT 0,
Descriere nvarchar(1000)
);

CREATE TABLE Curier(
Id_Curier INT PRIMARY KEY IDENTITY,
nume_complet nvarchar(100) NOT NULL,
email nvarchar(100) NOT NULL,
parola nvarchar(100) NOT NULL,
Vehicul nvarchar(100) FOREIGN KEY REFERENCES Tip_Vehicul(Denumire)
);

CREATE TABLE Client(
Id_Client INT PRIMARY KEY IDENTITY,
nume_complet nvarchar(100) NOT NULL,
email nvarchar(100) NOT NULL,
parola nvarchar(100) NOT NULL,
Id_Adresa_actuala INT FOREIGN KEY REFERENCES Adresa(Id_Adresa),
Id_Adresa INT FOREIGN KEY REFERENCES Adresa(Id_Adresa),
--Id_Card INT FOREIGN KEY REFERENCES Card_(Id_Card)
);

--Drop table Card_Actual

CREATE TABLE Card_Actual(
Id_Client INT FOREIGN KEY REFERENCES Client(Id_Client),
Id_Card INT FOREIGN KEY REFERENCES Card_(Id_Card),
CONSTRAINT pk_card_actual PRIMARY KEY (Id_Client, Id_Card)
);

CREATE TABLE Restaurant(
Nume_Restaurant nvarchar(300) NOT NULL,
Id_Meniu INT FOREIGN KEY REFERENCES Meniu(Id_Meniu) PRIMARY KEY,
Id_Adresa INT FOREIGN KEY REFERENCES Adresa(Id_Adresa)
);

CREATE TABLE Comanda(
Id_Comanda INT PRIMARY KEY IDENTITY,
Id_Client INT FOREIGN KEY REFERENCES Client(Id_Client),
Id_Restaurant INT FOREIGN KEY REFERENCES Restaurant(Id_Meniu),
Id_Curier INT FOREIGN KEY REFERENCES Curier(Id_Curier),
Denumire nvarchar(300) NOT NULL,
Pret FLOAT DEFAULT 0,
Durata_Aproximativa_Livrare Float DEFAULT 30,
Data_Comenzii DATETIME DEFAULT GETDATE()
);

/*
USE master
GO
DROP DATABASE Bolt_Food
*/

SELECT * FROM Card_;

---add into tables
USE Bolt_Food;
GO

--adresa
INSERT INTO Adresa(Tara, Cod_Postal, Strada, Numar, Nr_apartament)
values ('Romania', '400572', 'Strada Avram Iancu', 14, 5);

INSERT INTO Adresa(Tara, Cod_Postal, Strada, Numar, Nr_apartament)
values
 ('Romania', '400620', 'Strada Fabricii',76, 1),
 ('Romania', '400625', 'Strada Fabricii de zahar', 55, 4),
 ('Romania', '400624', 'Strada Fabricii', 13, 2),
 ('Romania', '400573', 'Strada Avram Iancu', 55, 3),
 ('Romania', '400573', 'Strada Avram Iancu', 55, 7),
 ('Romania', '615200', 'Strada Corbului', 14, -1),
 ('Romania', '615200', 'Strada Umbrei', 10, -1),
 ('Romania', '615200', 'Strada Muzeul Gaman', 11, -1),
 ('Romania', '615200', 'Strada Mitropolit Varlam', 11, -1),
 ('Romania', '615200', 'Strada Umbrei', 15, -1);

INSERT INTO Adresa(Tara, Cod_Postal, Strada, Numar, Nr_apartament)
values 
('Romania', '010841', 'Strada Prieteniei', 104, 43),
('Romania', '010841', 'Strada Prieteniei', 105, -43);

SELECT * FROM Adresa;

--Client
INSERT INTO Client(nume_complet, email, parola, Id_Adresa_actuala, Id_Adresa)
values 
('Adrian Doroftei', 'adrian.doroftei@gmail.com', '213433234adswd', 10, 1);

INSERT INTO Client(nume_complet, email, parola, Id_Adresa_actuala, Id_Adresa)
values 
('Gabriel Pislaru', 'gabriel.pislaru@gmail.com', '1231231', 11, 1),
('Larisa Teodorescu', 'larisa.teodorescu@gmail.com', 'adwdadwa213', 9, 3),
('Stefan Nastasa', 'stefan.nastasa@gmail.com', '6786dwanjhe', 2, 2),
('Flavian Tanase', 'flavian_tanase@yahoo.com', '123qew234adswd', 13, 13),
('Alexandru Butnaru', 'alex_but@yahoo.com', 'pisicapersana123', 13, 13);

INSERT INTO Client(nume_complet, email, parola, Id_Adresa_actuala, Id_Adresa)
values 
('Marian Marinescu', 'marian.marinescu@gmail.com', '213131swd', 9, 8),
('Andrei Popescu', 'andrei.popescu@gmail.com', 'sdfrdfdt', 3, 3),
('Niculaie Margine', 'nicu.margine@cnsm.ro', 'fhjygh', 7, 7),
('Matei Ionut Hanganu', 'ionut.han@gmail.net', 'jlihkugjy', 9, 7),
('Mihail Ghidoarca', 'mihail.gidi@gmail.com', 'sgdh546hggf', 10, 9),
('Nicu Pop', 'nicu.pop@gmail.com', 'adfsdf324234fsd', 6, 6),
('Mihai Petrutiu', 'mihai.petrutiu@yahoo.com', 'ihuigyjh', 4, 4),
('Rares Perta', 'rares.perta@gmail.com', 'a56786824234fsd', 13, 5),
('Mihai Pitrinjel', 'mihai_pit123@yahoo.com', '777m7m7m7m8m8', 12, 12);

SELECT * FROM Client;


---Card
INSERT INTO Card_(Companie, Denumire, Cod_plata, Tip, Data_De_Expirare)
values ('Revolut', 'Cardul lui Mihai Pitrinjel', '2134123487657655', 'Credit', '2024-10-03');

INSERT INTO Card_(Companie, Denumire, Cod_plata, Tip, Data_De_Expirare)
values 
('BT', 'Stefan Nastase', '3234165487698655', 'Credit', '2026-09-13'),
('Edenred', 'Stefan Nastase', '8790165480098655', 'De bonuri de masa', '2025-04-23'),
('BT', 'Gabriel Paslaru', '4444165455698655', 'Credit', '2026-01-22'),
('BT', 'Adrian Doroftei', '3211107487698609', 'Credit', '2027-09-11'),
('Revolut', 'Larisa Teodorescu', '9934165997690051', 'Credit', '2025-03-25'),
('Edenred', 'Rares Perta', '1234168987898051', 'De bonuri de masa', '2025-06-29'),
('Edenred', 'Mihai Petrutiu', '7734165987828043', 'De bonuri de masa', '2028-07-21'),
('BT', 'Mihai Petrutiu', '1135162987868007', 'Credit', '2029-06-01'),
('BT', 'Matei Ionut Hanganu', '9835164287867122', 'Credit', '2023-02-05'),
('BT', 'Niculaie Margine', '7735167787833118', 'Credit', '2022-12-08'),
('BT', 'Marian Marinescu', '3235165187833328', 'Credit', '2023-12-29'),
('BCR', 'Mihail Ghidoarca', '1535115187819727', 'Credit', '2023-12-29'),
('Revolut', 'Nicu Pop', '8835115187819799', 'Credit', '2025-11-28');

INSERT INTO Card_(Companie, Denumire, Cod_plata, Tip, Data_De_Expirare)
values ('BT', 'Flavian Tanase', '1735335187816764', 'Credit', '2027-12-13'),
('BT', 'Alexandru Butnaru', '8276835237819366', 'Credit', '2023-07-24');

SELECT * FROM Card_;

--Card_Actual
INSERT INTO Card_Actual
values 
(15, 5),
(1, 4),
(12, 6),
(13, 2),
(14, 3),
(7, 15),
(8, 16),
(6, 12),
(5, 11),
(4, 10),
(3, 13),
(2, 14),
(10, 8),
(9, 9),
(11, 7);

SELECT * FROM Card_Actual;

--Meniu

INSERT INTO Meniu
values ('https://www.kfc.ro/'),
('https://www.mcdonalds.ro/'),
('https://www.bigbelly-cluj.ro/'),
('https://www.taco-bell.ro/'),
('https://pizzeria-la-cuptor.business.site/'),
('https://holidayfun.ro/'),
('https://klausenburger.ro/'),
('https://spartan.ro/'),
('https://austriantaste.ro/'),
('https://irishmusicpub.ro/'),
('https://londonbrothers.ro/');

SELECT * FROM Meniu;

--Restaurant

INSERT INTO Restaurant
values 
('KFC', 1, 6),
('MC', 2, 8),
('London Brothers', 11, 8),
('Big Belly', 3, 8),
('Taco Bell', 4, 6),
('Irish Pub and Music', 10, 7),
('Pizza La Cuptor', 5, 13),
('Klausen Burger', 6, 8),
('Spartan', 8, 8),
('Austrian Taste', 9, 6);

SELECT * FROM Restaurant;

--Bauturi

INSERT INTO Bauturi
values 
(1, 0.4, 'Cola KFC', 3.0, 'Cola de la KFC'),
(1, 0.4, 'Fanta KFC', 3.0, 'Fanta de la KFC'),
(1, 0.4, 'Lipton KFC', 3.0, 'Lipton de la KFC'),
(2, 0.4, 'Cola MC', 3.0, 'Cola de la MC'),
(2, 0.4, 'Fanta MC', 3.0, 'Fanta de la MC'),
(2, 0.4, 'Lipton MC', 3, 'Lipton de la MC'),
(5, 1.5, 'Limonada Family', 20.5, 'Limonada mare pentru intreaga familie'),
(5, 0.8, 'Milkshake', 14, NULL),
(8, 0.5, 'Pepsi', 2, NULL),
(8, 0.5, 'Mirinda', 2, NULL),
(8, 0.5, '7up', 2, NULL),
(7, 0.33, 'Cola Spartan', 2.5, NULL);


SELECT * FROM Bauturi;

--Fel_De_Mancare

INSERT INTO Fel_De_Mancare
values 
(1, 460, 'Cispy Picant KFC', 25.0, 'Cispy Picant de la KFC'),
(1, 460, 'Cispy Nepicant KFC', 25.0, NULL),
(2, 460, 'Chimken Nuggets MC', 24.0, 'Chimken Nuggets'),
(2, 300, 'Salata MC', 19.0, NULL),
(8, 460, 'Cispy Mic Spartan', 32.0, NULL),
(8, 500, 'Cispy Mare Spartan', 36.0, NULL),
(8, 500, 'Falafel Spartan', 32.0, NULL),
(5, 760, 'Pizza Casei', 36.0, 'Pizza Casei'),
(10, 400, 'Pizza Fun and Music', 22.0, NULL),
(11, 500, 'Burgerul Casei', 32.0, NULL),
(4, 200, 'Nachos', 17.0, NULL),
(3, 500, 'Big Belly Pizza', 26.0, NULL);


SELECT * FROM Fel_De_Mancare;

--Tip_Vehicul
INSERT INTO Tip_Vehicul(Denumire)
values 
('Masina');

INSERT INTO Tip_Vehicul(Denumire, Tonaj)
values 
('Scuter', 0.05),
('Bicicleta', 0.015),
('Motoreta', 0.2),
('Trotineta',  0.015);


SELECT * FROM Tip_Vehicul;

--Curier
INSERT INTO Curier
values 
('Alexandru Ioan State', 'alex_state3@yahoo.com', '123pizza123', 'Masina'),
('Matei Gheorghiu', 'matei.gheorghiu@gmail.com', 'qewrgtrete5', 'Masina'),
('Stefan Atumulesei', 'stefan.atomulesei@yahoo.com', 'ciocolata012', 'Masina'),
('Adrian Doroftei', 'adrian.doroftei@gmail.com', '123rwegf', 'Bicicleta'),
('Cristian Petec', 'cris.petec@yahoo.com', 'cvhgfd324', 'Bicicleta'),
('Teodor Marin', 'teo.marin@gmail.com', 'asdgtryrerte', 'Trotineta'),
('Ion Platon', 'ion.platon@gmail.com', 'prola', 'Scuter'),
('Casian Manole', 'casian.manole@yahoo.com', 'prola123', 'Masina'),
('Stefan Tataru', 'tataru.stefan@gmail.com', 'dsfdhstyhfdyff', 'Masina'),
('Catalin Teodorescu', 'cata.teodorescu@gmail.com', 'dsfhg', 'Scuter'),
('Emil Cosma', 'emil.cosma@gmail.com', 'redissus', 'Masina'),
('Sabin Teodorescu', 'teodorescu.sabin@gmail.com', 'sssssssssssss1', 'Masina'),
('Ivona Vartic', 'ivona.vartic@yahoo.com', 'adsgsgtrdtrw', 'Bicicleta');



SELECT * FROM Client;
SELECT * FROM Restaurant;
SELECT * FROM Curier;

--Comanda

INSERT INTO Comanda
values 
(15, 3, 7, 'O pizza mare cu pui', 32.0, 20.0, '2022-09-01'),
(14, 5, 12, 'O pizza casei mare', 36.0, 30.0, '2022-09-05'),
(13, 6, 6, 'Burgir', 28.0, 40.0, '2022-09-05'),
(12, 6, 11, 'Burgir', 28.0, 35.0, '2022-09-06'),
(11, 5, 3, 'O pizza casei mare', 36.0, 30.0, '2022-09-10'),
(10, 5, 9, 'O pizza casei mare', 36.0, 30.0, '2022-09-11'),
(9, 2, 9, 'Meniu nuggets', 24.0, 50.0, '2022-09-22'),
(8, 2, 11, 'Meniu nuggets', 24.0, 50.0, '2022-09-25'),
(7, 2, 13, 'Meniu nuggets', 24.0, 50.0, '2022-09-28'),
(6, 1, 4, 'Cispy Picant KFC', 25.0, 60.0, '2022-09-28'),
(5, 1, 13, 'Cispy Picant KFC', 25.0, 54.0, '2022-09-30'),
(4, 8, 13, 'Cispy Mic Spartan', 32.0, 54.0, '2022-10-01'),
(3, 8, 10, 'Cispy Mare Spartan', 36.0, 40.0, '2022-10-02'),
(2, 9, 9, '-', 30.0, 20.0, '2022-10-02'),
(1, 9, 13, '-', 30.0, 20.0, '2022-10-05'),
(11, 9, 7, '-', 30.0, 20.0, '2022-10-06'),
(12, 10, 2, 'Pizza Fun and Music', 22.0, 30.0, '2022-10-10'),
(10, 11, 3, 'Burgir', 32.0, 40.0, '2022-10-10'),
(15, 5, 11, 'O pizza casei mare', 36.0, 30.0, '2022-10-11'),
(8, 4, 6, 'Nachos', 14.0, 40.0, '2022-10-22');


SELECT * FROM Comanda;