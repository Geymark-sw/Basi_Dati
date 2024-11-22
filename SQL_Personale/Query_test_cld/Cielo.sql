-- QUERY 1
/*1. Quali sono le compagnie che hanno voli che atterrano in
un qualche aeroporto di New York [3 punti]*/

SELECT DISTINCT ap.comp
FROM arrpart ap
JOIN luogoaeroporto la 
ON ap.arrivo = la.aeroporto
WHERE la.citta = 'New York'

-- QUERY 2
/*2. Qual è la durata media di un volo di ogni compagnia
(restituire nome della compagnia e durata media dei suoi
voli) [3 punti]*/

SELECT v.comp, AVG(v.durataminuti) 
FROM volo v
GROUP BY v.comp