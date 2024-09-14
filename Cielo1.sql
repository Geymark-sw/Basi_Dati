--1
SELECT codice, comp
FROM Volo
WHERE durataMinuti > 180

--2
SELECT DISTINCT comp
FROM Volo
WHERE durataMinuti > 180

--3
SELECT v.codice, v.comp
FROM Volo v, Aeroporto a
WHERE a.codice = 'CIA' --DA RIVEDERE, NON È GIUSTO