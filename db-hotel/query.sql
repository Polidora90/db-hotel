-- 1. Seleziona tutti gli ospiti che sono stati identificati con la carta di identità
SELECT *
FROM `ospiti`
WHERE `document_type` = "CI";

-- 2. Seleziona tutti gli ospiti che sono nati dopo il 1988
SELECT *
FROM `ospiti`
WHERE YEAR(`date_of_birth`) > "1988";

-- 3. Seleziona tutti gli ospiti che hanno almeno 20 anni (al momento dell'esecuzione della query)
SELECT `date_of_birth`
FROM `ospiti`
WHERE (year(CURRENT_TIMESTAMP) - year(date_of_birth)) >= 20;

-- 4. Seleziona tutti gli ospiti il cui nome inizia con la D
SELECT *
FROM `ospiti`
WHERE `name` LIKE 'D%';

-- 5. Calcola il totale incassato dagli ordini accepted
SELECT SUM(`price`)
AS `incassoTotale`
FROM `pagamenti`
WHERE `status` = "accepted";

-- 6.Qual è il prezzo massimo pagato?
SELECT MAX(`price`)
FROM `pagamenti`;

-- 7. Seleziona ospiti riconosciuti con la patente e nati nel 1945
SELECT *
FROM `ospiti`
WHERE (`document_type` = "Driver License") AND (year(`date_of_birth`) = 1945);

