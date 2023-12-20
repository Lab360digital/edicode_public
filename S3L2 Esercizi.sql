
CREATE TABLE Aeroporto (
                    Citta TEXT (80) NOT NULL, 
                    Nazione TEXT (80) NOT NULL,
                    NumPiste INTEGER);


CREATE TABLE Volo(
                IdVolo CHAR (10) PRIMARY KEY,
                GiornoSett TEXT (60) NOT NULL,
                CittaPart TEXT (80) NOT NULL,
                OraPart TIME,
                CittaArr TEXT (80) NOT NULL,
                OraArr TIME,
                TipoAer TEXT (80)
                );

CREATE TABLE Aereo (
                TipoAer TEXT (100),
                NumPass INTEGER,
                QtaMerci DOUBLE
                );

INSERT INTO Aeroporto VALUES ('Roma','Italia',25);
INSERT INTO Aeroporto VALUES ('Barcellona','Spagna',50);
INSERT INTO Aeroporto VALUES ('Praga','Repubblica Ceca',55);
INSERT INTO Aeroporto VALUES ('Milano','Italia',15);
INSERT INTO Aeroporto VALUES ('Madrid','Spagna',NULL);
INSERT INTO Aeroporto VALUES ('Sicilia','Italia',25);
INSERT INTO Aeroporto VALUES ('Amsterdam','Olanda',40);
INSERT INTO Aeroporto VALUES ('Bruxelles','Belgio',NULL);
INSERT INTO Aeroporto VALUES ('Valencia','Spagna',14);
INSERT INTO Aeroporto VALUES ('Torino','Italia',22);

INSERT INTO Volo VALUES ('AZ274','lunedì','Praga', '05:20:15', 'Milano', '07:20:00', 'normal');
INSERT INTO Volo VALUES ('AC3045','martedì','Madrid', '14:30:00', 'Milano', '16:20:00', 'normal');
INSERT INTO Volo VALUES ('AC8247','martedì','Sicilia', '18:00:00', 'Milano', '20:20:00', 'normal');
INSERT INTO Volo VALUES ('RC9865','lunedì','Valencia', '10:15:00', 'Bologna', '12:20:00', 'normal');                
INSERT INTO Volo VALUES ('AZ2744','mercoledì','Amsterdam', '08:00:00', 'Milano', '10:00:00', 'normal');
INSERT INTO Volo VALUES ('RV9632','mercoledì','Bruxelles', '12:20:00', 'Milano', '14:20:00', 'normal');
INSERT INTO Volo VALUES ('AO7852','giovedì','Torino', '08:30:00', 'Milano', '10:20:00', 'normal');    
INSERT INTO Volo VALUES ('AO2596','giovedì','Roma', '20:30:00', 'Milano', '22:30:00', 'normal');
INSERT INTO Volo VALUES ('AR5685','venerdì','Barcellona', '06:30:00', 'Milano', '08:30:00', 'normal');
INSERT INTO Volo VALUES ('AC3596','venerdì','Torino', '23:00:00', 'Milano', '00:00:00', 'normal');

INSERT INTO Aereo VALUES ('normal',45, 80);
INSERT INTO Aereo VALUES ('normal',80, 70);
INSERT INTO Aereo VALUES ('normal',55, 90);
INSERT INTO Aereo VALUES ('normal',60, 55);
INSERT INTO Aereo VALUES ('normal',75, 75);
INSERT INTO Aereo VALUES ('normal',88, 80);
INSERT INTO Aereo VALUES ('normal',75, 82);
INSERT INTO Aereo VALUES ('normal',85, 88);
INSERT INTO Aereo VALUES ('normal',95, 90);
INSERT INTO Aereo VALUES ('normal',105,78);
/*
--Domanda1
SELECT *
FROM Aeroporto 
WHERE NumPiste is null;

--Domanda2
SELECT TipoAer 
FROM Volo
WHERE CittaPart = 'Torino';

--Dmanda3
SELECT CittaPart
FROM Volo
WHERE CittaArr ='Bologna';

--Domanda4
SELECT CittaPart, CittaArr
FROM Volo
WHERE IdVolo = 'AZ274';
*/

Select* 
From Volo
Where CittaArr = 'Milano';

SELECT*
FROM Volo
WHERE GiornoSett = 'Lunedì';

/*
-- tipo aereo piu utilizzato
Select TipoAer
From Volo
WHERE MAX IN (SELECT COUNT(TipoAer) FROM Volo);
*/
