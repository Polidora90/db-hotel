-- 1. Conta gli ospiti raggruppandoli per anno di nascita
SELECT
COUNT(YEAR(`date_of_birth`)), YEAR(`date_of_birth`)
FROM `ospiti`
GROUP BY YEAR(`date_of_birth`);

-- 2. Somma i prezzi dei pagamenti raggruppandoli per status
SELECT `status`, COUNT(`status`), SUM(`price`)
FROM `pagamenti`
GROUP BY `status`;

-- 3. Conta quante volte è stata prenotata una stanza
SELECT`stanza_id`, COUNT(`stanza_id`)
FROM `prenotazioni`
GROUP BY `stanza_id`;