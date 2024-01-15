-- Creazione della tabella vendite
CREATE TABLE vendite (
    IDTransazione INT PRIMARY KEY,
    CategoriaProdotto VARCHAR(50),
    Prezzo DECIMAL(10, 2),
    Sconto DECIMAL(4, 2)
);

-- Inserimento di 20 righe di dati
INSERT INTO vendite (IDTransazione, CategoriaProdotto, Prezzo, Sconto)
VALUES
(100001, 'cura capelli', 25.99, 0.1),
(100002, 'hairstyle', 45.50, 0.15),
(100003, 'styler tools', 34.99, 0.2),
(100004, 'cura capelli', 29.99, 0.05),
(100005, 'hairstyle', 50.00, 0.1),
(100006, 'styler tools', 39.95, 0.2),
(100007, 'cura capelli', 27.50, 0.15),
(100008, 'hairstyle', 48.75, 0.1),
(100009, 'styler tools', 36.49, 0.2),
(100010, 'special promo', 19.99, 0.2),
(100011, 'cura capelli', 31.25, 0.1),
(100012, 'hairstyle', 42.80, 0.15),
(100013, 'styler tools', 32.99, 0.2),
(100014, 'cura capelli', 28.75, 0.15),
(100015, 'hairstyle', 47.00, 0.1),
(100016, 'styler tools', 38.45, 0.2),
(100017, 'cura capelli', 26.99, 0.1),
(100018, 'hairstyle', 49.90, 0.15),
(100019, 'styler tools', 35.75, 0.2),
(100020, 'special promo', 22.50, 0.2);

-- Creazione della tabella dettagli_vendita
CREATE TABLE dettagli_vendita (
    IDTransazione INT,
    DataTransazione DATE,
    QuantitaAcquistata INT,
    FOREIGN KEY (IDTransazione) REFERENCES vendite(IDTransazione)
);

-- Inserimento delle 20 righe di dati
INSERT INTO dettagli_vendita (IDTransazione, DataTransazione, QuantitaAcquistata)
VALUES
(100001, '2023-01-01', 1),
(100002, '2023-01-02', 2),
(100003, '2023-01-03', 1),
(100004, '2023-01-04', 3),
(100005, '2023-01-05', 1),
(100006, '2023-01-06', 2),
(100007, '2023-01-07', 1),
(100008, '2023-01-08', 2),
(100009, '2023-01-09', 1),
(100010, '2023-01-10', 1),
(100011, '2023-01-11', 3),
(100012, '2023-01-12', 1),
(100013, '2023-01-13', 2),
(100014, '2023-01-14', 1),
(100015, '2023-01-15', 2),
(100016, '2023-01-20', 1),
(100017, '2023-01-20', 2),
(100018, '2023-01-20', 1),
(100019, '2023-01-20', 3),
(100020, '2023-01-20', 1);

INSERT INTO vendite (IDTransazione, CategoriaProdotto, Prezzo, Sconto)
VALUES
(100021, 'cura capelli', 24.99, 0.5),
(100022, 'hairstyle', 40.00, 0.6),
(100023, 'styler tools', 29.95, 0.7),
(100024, 'cura capelli', 27.99, 0.5),
(100025, 'hairstyle', 45.75, 0.6),
(100026, 'styler tools', 35.49, 0.7),
(100027, 'cura capelli', 23.50, 0.5),
(100028, 'hairstyle', 42.25, 0.6),
(100029, 'styler tools', 32.99, 0.7),
(100030, 'special promo', 17.50, 0.6),
(100031, 'cura capelli', 30.99, 0.5),
(100032, 'hairstyle', 38.80, 0.6),
(100033, 'styler tools', 28.99, 0.7),
(100034, 'cura capelli', 26.75, 0.5),
(100035, 'hairstyle', 48.50, 0.6);

-- Aggiunta di 15 righe di valori a dettagli_vendita con almeno il 50% di sconto
INSERT INTO dettagli_vendita (IDTransazione, DataTransazione, QuantitaAcquistata)
VALUES
(100021, '2024-02-01', 1),
(100022, '2024-02-02', 2),
(100023, '2024-02-03', 1),
(100024, '2023-02-04', 3),
(100025, '2023-02-05', 1),
(100026, '2023-02-06', 2),
(100027, '2023-02-07', 1),
(100028, '2023-02-08', 2),
(100029, '2023-02-09', 1),
(100030, '2023-02-10', 1),
(100031, '2023-02-11', 3),
(100032, '2023-02-12', 1),
(100033, '2023-02-13', 2),
(100034, '2023-02-14', 1),
(100035, '2023-02-15', 2);

/*
# Selezionare una data (domanda3.1)
SELECT v.*
FROM vendite v
JOIN dettagli_vendita dv ON v.IDTransazione = dv.IDTransazione
WHERE dv.DataTransazione = '2023-01-20';

#Sconto superiore al 50% (domanda3.2)
SELECT *
FROM vendite
WHERE Sconto>0.5;

#Totale vendite per categorie (domanda 4.1)
SELECT
    CategoriaProdotto,
    SUM(Prezzo * (1 - Sconto)) AS TotaleVenduto
FROM
    vendite
GROUP BY
    CategoriaProdotto;

#Quantità per categoria (domanda 4.2)
SELECT
    v.CategoriaProdotto,
    SUM(dv.QuantitaAcquistata) AS NumeroTotaleProdottiVenduti
FROM
    vendite v
JOIN
    dettagli_vendita dv ON v.IDTransazione = dv.IDTransazione
GROUP BY
    v.CategoriaProdotto;
#Vendite ultimo trimestre (domanda 5.1)
SELECT v.*
FROM vendite v
JOIN dettagli_vendita dv ON v.IDTransazione = dv.IDTransazione
WHERE YEAR(dv.DataTransazione) = YEAR(CURRENT_DATE)
  AND QUARTER(dv.DataTransazione) = QUARTER(CURRENT_DATE);


#Venduto per mese (domanda 5.2)
SELECT
    YEAR(dv.DataTransazione) AS Anno,
    MONTH(dv.DataTransazione) AS Mese,
    SUM(v.Prezzo * (1 - v.Sconto)) AS TotaleVenduto
FROM
    vendite v
JOIN
    dettagli_vendita dv ON v.IDTransazione = dv.IDTransazione
GROUP BY
    YEAR(dv.DataTransazione),
    MONTH(dv.DataTransazione)
ORDER BY
    Anno, Mese;


#Categoria con lo sconto medio piu alto (domanda7)
SELECT CategoriaProdotto, MAX(MediaSconto) AS MaxScontoMedio
FROM (    
    SELECT
         v.CategoriaProdotto,
        AVG(v.Sconto) AS MediaSconto 
    FROM
        vendite v
    GROUP BY
        v.CategoriaProdotto
    ) AS MediaCategoria 
ORDER BY MaxScontoMedio  
LIMIT 1;


#Vendite mese per mese (domanda8)
WITH VenditeMensili AS (
    SELECT
        YEAR(dv.DataTransazione) AS Anno,
        MONTH(dv.DataTransazione) AS Mese,
        SUM(v.Prezzo * (1 - v.Sconto)) AS TotaleVenduto
    FROM
        vendite v
    JOIN
        dettagli_vendita dv ON v.IDTransazione = dv.IDTransazione
    GROUP BY
        YEAR(dv.DataTransazione),
        MONTH(dv.DataTransazione)
)
SELECT
    Anno,
    Mese,
    TotaleVenduto,
    LAG(TotaleVenduto) OVER (ORDER BY Anno, Mese) AS VenditeMesePrecedente,
    CASE
        WHEN LAG(TotaleVenduto) OVER (ORDER BY Anno, Mese) IS NOT NULL THEN
            (TotaleVenduto - LAG(TotaleVenduto) OVER (ORDER BY Anno, Mese)) / LAG(TotaleVenduto) OVER (ORDER BY Anno, Mese) * 100
        ELSE
            NULL
    END AS IncrementoDecrementoPercentuale
FROM
    VenditeMensili
ORDER BY
    Anno, Mese;


#vendite per stagione (domanda9)
SELECT
    Stagione,
    SUM(v.Prezzo * (1 - v.Sconto)) AS VendutoPerStagione
FROM (
    SELECT
        dv.DataTransazione,
        CASE
            WHEN MONTH(dv.DataTransazione) BETWEEN 3 AND 5 THEN 'Primavera'
            WHEN MONTH(dv.DataTransazione) BETWEEN 6 AND 8 THEN 'Estate'
            WHEN MONTH(dv.DataTransazione) BETWEEN 9 AND 11 THEN 'Autunno'
            ELSE 'Inverno'
        END AS Stagione
    FROM
        dettagli_vendita dv
    JOIN
        vendite v ON dv.IDTransazione = v.IDTransazione
) AS TransazioniPerStagione
GROUP BY
    Stagione;
#domanda 10 (non finita)
-- Creare la tabella clienti
CREATE TABLE clienti (
    IDCliente VARCHAR(7) PRIMARY KEY,
    NomeCliente VARCHAR(50),
    CognomeCliente VARCHAR(50),
    IDTransazione INT (6)
);

-- Inserire valori nella tabella clienti con ID cliente alfanumerico
INSERT INTO clienti (IDCliente, NomeCliente, CognomeCliente, IDTransazione)
VALUES
    ('A123456', 'Mario', 'Rossi', 100021),
    ('B234567', 'Giulia', 'Bianchi', 100022),
    ('C345678', 'Alessio', 'Verdi', 100023),
    ('D456789', 'Sara', 'Gialli', 100020),
    ('E567890', 'Luca', 'Neri', 100024),
    ('F678901', 'Elena', 'Marroni', 100025),
    ('G789012', 'Giovanni', 'Blu', 100026),
    ('H890123', 'Francesca', 'Rosa', 100019),
    ('I901234', 'Marco', 'Arancio', 100028),
    ('J012345', 'Valentina', 'Viola', 100029);
*/

