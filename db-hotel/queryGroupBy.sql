-- 1. Conta gli ospiti raggruppandoli per anno di nascita
SELECT YEAR(`date_of_birth`)
COUNT(`ID`)
FROM `ospiti`
GROUP BY YEAR(`date_of_birth`);

-- 2. Somma i prezzi dei pagamenti raggruppandoli per status
SELECT `STATUS`, SUM(`price`)
FROM `pagamenti`
GROUP BY `status`;

-- 3. Conta quante volte è stata prenotata una stanza
SELECT`stanza_id`, COUNT(`stanza_id`)
FROM `prenotazioni`
GROUP BY `stanza_id`;

-- 4. fai un'analisi per vedere se ci sono ore in cui le prenotazioni sono più frequenti
SELECT HOUR(`created_at`) AS `ora`, COUNT(`id`)
FROM `prenotazioni`
GROUP BY `ora`

-- 5. Quante prenotazioni ha fatto l'ospite che ha fatto più prenotazioni?
SELECT `ospite_id`, COUNT(*)
FROM (`prenotazioni_has_ospiti`)
GROUP BY (`ospite_id`)
ORDER BY `prenotazioni`
DESC LIMIT 1
