-- QUERY 1
/*1. Quali sono le compagnie che hanno voli che atterrano in
un qualche aeroporto di New York [3 punti]*/

SELECT DISTINCT ap.comp
FROM arrpart ap
JOIN luogoaeroporto la 
ON ap.arrivo = la.aeroporto
WHERE la.citta = 'New York'