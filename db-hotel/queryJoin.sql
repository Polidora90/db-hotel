-- 1. Come si chiamano gli ospiti che hanno fatto più di due prenotazioni?
SELECT COUNT (`prenotazioni_has_ospiti`. `prenotazione_id`) AS `n_prenotazioni`
FROM `prenotazioni_has_ospiti`
LEFT JOIN `ospiti`
ON `prenotazioni_has_ospiti`.`ospite_id` = `ospiti`.`id`;
GROUP BY `ospiti`, `id`
HAVING `n_prenotazioni` > 2

-- 2. Stampare tutti gli ospiti per ogni prenotazione
SELECT *
FROM `ospiti`
INNER JOIN prenotazioni_has_ospiti
ON ospiti.id = prenotazioni_has_ospiti.ospite_id;

-- 3. Stampare Nome, Cognome, Prezzo e Pagante per tutte le prenotazioni fatte a Maggio 2018
SELECT `ospiti`.`name` AS `nome ospite`,
    `ospiti`.`lastname` AS `cognome ospite`,
    `pagamenti`.`price` AS `prezzo `, 
    `paganti`.`name` AS `nome pagante`,
    `paganti`,`lastname` AS `cognome pagante`,
FROM `prenotazioni`
LEFT JOIN `prenotazioni_has_ospiti`
    ON `prenotazioni_has_ospiti`.`prenotazione_id` = `prenotazioni`.`id`
LEFT JOIN `ospiti`
    ON `prenotazioni_has_ospiti`.`ospite_id` = `ospiti`.`id`
LEFT JOIN `pagamenti`
    ON `prenotazioni`.`id` = `pagamenti`.`prenotazione_id`
LEFT JOIN `paganti`
    ON `paganti`.`id` = `pagamenti`.`pagante_id`
WHERE YEAR(`prenotazioni`.`created_at`) = 2018
    AND MONTH (`prenotazioni`.`created_at`) = 5
   

-- 4. Fai la somma di tutti i prezzi delle prenotazioni per le stanze del primo piano
SELECT SUM(`pagamenti`.`price`) AS `prezzo_totale`
FROM `pagamenti`
LEFT JOIN `prenotazioni`
    ON `prenotazioni`.`id` = `pagamenti`.`prenotazione_id`
LEFT JOIN `stanze`
    ON `prenotazioni`.`stanza_id` = `stanze`.`id`
WHERE `stanze`.`floor` = 1

-- 5. Prendi i dati di fatturazione per le prenotazioni con id=7
SELECT
FROM `pagamenti`
LEFT JOIN `paganti`
     ON `pagamenti`.`pagante_id` = `paganti`.`id`
WHERE `pagamenti`.`prenotazione_id` = 7

-- 6. Stampa le stanze che non sono mai state prenotate
SELECT *
FROM `prenotazioni`
RIGHT JOIN `stanze`
    ON `stanze`.`id` = `prenotazioni`.`stanza_id`
WHERE `prenotazioni`.`id` IS NULL

