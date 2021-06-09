-- 1. Seleziona tutti gli ospiti che sono stati identificati con la carta di identità
SELECT *,
FROM `ospiti`,
WHERE `document_type` = "CI";

-- 2. Seleziona tutti gli ospiti che sono nati dopo il 1988
SELECT *,
FROM `ospiti`,
WHERE YEAR(`date_of_birth`) > "1988";

-- 3. Seleziona tutti gli ospiti che hanno almeno 20 anni (al momento dell'esecuzione della query)
SELECT `date_of_birth`
FROM `ospiti`
WHERE (year(CURRENT_TIMESTAMP) - year(date_of_birth)) >= 20;

