--1
SELECT DISTINCT cognome FROM persona
--2
SELECT nome, cognome FROM persona WHERE posizione = 'Ricercatore'
--3
SELECT nome, cognome FROM persona WHERE posizione = 'Professore Associato' AND cognome LIKE 'V%'
--4
SELECT nome, cognome FROM persona WHERE posizione IN ('Professore Associato', 'Professore Ordinario') AND cognome LIKE 'V%'
--5
SELECT * FROM progetto WHERE fine < CURRENT_DATE
--6
SELECT id, nome FROM progetto ORDER BY inizio ASC
--7
SELECT id,nome FROM wp ORDER BY nome ASC
--8
SELECT DISTINCT tipo FROM assenza
--9
SELECT DISTINCT tipo FROM attivitaprogetto
--10
SELECT DISTINCT giorno FROM attivitanonprogettuale WHERE tipo = 'Didattica' ORDER BY giorno ASC