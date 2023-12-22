-- Tabella Dipendente
CREATE TABLE Dipendente (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    cognome VARCHAR(255),
    email VARCHAR(255),
    numerotelefono VARCHAR(20),
    data_assunzione DATE,
    id_lavoro INT,
    salario DECIMAL(10, 2),
    id_manager INT,
    id_dipartimento INT
);

-- Tabella Dipartimento
CREATE TABLE Dipartimento (
    id_dipartimento INT PRIMARY KEY,
    nome_dip VARCHAR(255),
    id_manager INT,
    id_location INT
);

-- Inserimento dati aggiornato nella tabella Dipendente
INSERT INTO Dipendente (id, nome, cognome, email, numerotelefono, data_assunzione, id_lavoro, salario, id_manager, id_dipartimento)
VALUES
(0001, 'Mario', 'Rossi', 'mario.rossi@email.com', '1234567890', '2022-01-15', 1, 60000.00, NULL, 2001),
(0002, 'Giulia', 'Bianchi', 'giulia.bianchi@email.com', '9876543210', '2022-02-20', 2, 75000.00, 1001, 1002),
(0003, 'Alessio', 'Verdi', 'alessio.verdi@email.com', '5551234567', '2022-03-10', 1, 50000.00, 2002, 2003),
(0004, 'Sara', 'Gialli', 'sara.gialli@email.com', '7890123456', '2022-04-05', 3, 80000.00, 2002, 1002),
(0005, 'Luca', 'Neri', 'luca.neri@email.com', '2345678901', '2022-05-12', 2, 70000.00, 1001, 2003),
(0006, 'Elena', 'Marroni', 'elena.marroni@email.com', '8765432109', '2022-06-18', 1, 55000.00, NULL, 1001),
(0007, 'Giovanni', 'Blu', 'giovanni.blu@email.com', '3210987654', '2022-07-22', 3, 90000.00, 1001, 2003),
(0008, 'Francesca', 'Rosa', 'francesca.rosa@email.com', '4321098765', '2022-08-30', 2, 72000.00, 2002, 1002),
(0009, 'Marco', 'Arancio', 'marco.arancio@email.com', '6789012345', '2022-09-14', 3, 85000.00, NULL, 2003),
(0010, 'Valentina', 'Viola', 'valentina.viola@email.com', '1234509876', '2022-10-01', 1, 58000.00, 1001, 1001);

-- Inserimento dati aggiornato nella tabella Dipartimento
INSERT INTO Dipartimento (id_dipartimento, nome_dip, id_manager, id_location)
VALUES
(1001, 'Dipartimento IT', 2002, 101),
(1002, 'Dipartimento Finanze', 1001, 102),
(1003, 'Dipartimento Ricerca', 1007, 103),
(1004, 'Dipartimento Marketing', 1008, 104),
(1005, 'Dipartimento Risorse Umane', 1004, 105),
(1006, 'Dipartimento Produzione', 1005, 106),
(1007, 'Dipartimento Vendite', 1003, 107),
(1008, 'Dipartimento Logistica', 1010, 108),
(1009, 'Dipartimento Amministrazione', 1006, 109),
(1010, 'Dipartimento Comunicazioni', 1009, 110);
/*
--
SELECT d.id_manager AS Id_Manager, d.data_assunzione AS Data_Assunzione_Manager, dto.id_dipartimento AS Id_dto
FROM Dipendente d
JOIN Dipartimento dto ON d.id_dipartimento = dto.id_dipartimento;

--domanda1
SELECT DATE_FORMAT(d.data_assunzione, '%M %e, %Y') AS Data_Assunzione_Manager, dto.id_dipartimento AS Id_Dto, d.id_manager
FROM Dipendente d
JOIN Dipartimento dto ON d.id_dipartimento = dto.id_dipartimento
WHERE d.id_manager IS NOT NULL AND dto.nome_dip = 'Dipartimento Amministrazione';

--domanda2
SELECT nome, cognome 
FROM Dipendente
WHERE MONTH(data_assunzione) = 6;

domanda3
SELECT
    YEAR(data_assunzione) AS Anno,
    COUNT(*) AS NumeroDipendentiAssunti
FROM
    Dipendente
GROUP BY
    YEAR(data_assunzione)
HAVING
    COUNT(*) > 10;
*/
--domanda4
SELECT dto.nome_dip AS NomeDipartimento, d.nome AS NomeManager, d.salario AS SalarioManager
FROM
    Dipendente d
JOIN
    Dipartimento dto ON d.id_dipartimento = dto.id_dipartimento
WHERE
   d.id_manager IS NOT NULL;
