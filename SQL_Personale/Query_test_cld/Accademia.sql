-- QUERY 1
/*1. Quali sono le persone con stipendio di al massimo 40000
euro [2 punti]*/

SELECT *
FROM Persona
WHERE stipendio <= 40000


-- QUERY 2
/*2. Quali sono i ricercatori che lavorano ad almeno un
progetto e hanno uno stipendio di al massimo 40000 [2
punti]*/

SELECT *
FROM Persona pe
JOIN AttivitaProgetto ap ON pe.id = ap.persona
WHERE pe.stipendio <= 40000 AND pe.posizione = 'Ricercatore'


-- QUERY 3
/*3. Qual è il budget totale dei progetti nel db [2 punti]*/

SELECT SUM(pr.budget) totale_budget
FROM progetto pr


-- QUREY 4
/*4. Qual è il budget totale dei progetti a cui lavora ogni
persona. Per ogni persona restituire nome, cognome e
budget totale dei progetti nei quali è coinvolto. [3 punti]*/

SELECT pe.nome, pe.cognome, SUM(pr.budget)
FROM persona pe
JOIN attivitaprogetto ap ON pe.id = ap.persona
JOIN progetto pr ON ap.progetto = pr.id
GROUP BY pe.nome, pe.cognome


-- QUREY 5
/*5. Qual è il numero di progetti a cui partecipa ogni
professore ordinario. Per ogni professore ordinario,
restituire nome, cognome, numero di progetti nei quali è
coinvolto [3 punti]*/

SELECT pe.nome, pe.cognome, COUNT(pr.id)
FROM persona pe
JOIN attivitaprogetto ap ON pe.id = ap.persona
JOIN progetto pr on ap.progetto = pr.id
WHERE pe.posizione = 'Professore Ordinario'
GROUP BY pe.id


-- QUERY 6
/*6. Qual è il numero di assenze per malattia di ogni
professore associato. Per ogni professore associato,
restituire nume, cognome e numero di assenze per
malattia [3 punti]*/

SELECT pe.nome, pe.cognome, COUNT(ass.id)
FROM persona pe
JOIN assenza ass
	ON pe.id = ass.persona
WHERE ass.tipo = 'Malattia' AND pe.posizione = 'Professore Associato'
GROUP BY pe.id


-- QUERY 7 - Gpt perchè esce vuoto
/*7. Qual è il numero totale di ore, per ogni persona, dedicate
al progetto con id ‘5’. Per ogni persona che lavora al
progetto, restituire nome, cognome e numero di ore totali
dedicate ad attività progettuali relative al progetto [4
punti]*/

SELECT 
    persona.nome,
    persona.cognome,
    SUM(attivitaprogetto.oreDurata) AS ore_totali
FROM 
    persona
JOIN 
    attivitaprogetto
ON 
    persona.id = attivitaprogetto.persona
    
JOIN progetto
ON attivitaprogetto.progetto = progetto.id
WHERE 
    progetto.id = 5
GROUP BY 
    persona.nome, persona.cognome;


-- QUERY 8
/*8. Qual è il numero medio di ore delle attività progettuali
svolte da ogni persona. Per ogni persona, restituire nome,
cognome e numero medio di ore delle sue attività
progettuali (in qualsivoglia progetto) [3 punti]*/

SELECT pe.nome, pe.cognome, AVG(ap.oredurata)
FROM persona pe
JOIN attivitaprogetto ap
	ON pe.id = ap.persona
GROUP BY pe.id


-- QUERY 9
/*9. Qual è il numero totale di ore, per ogni persona, dedicate
alla didattica. Per ogni persona che ha svolto attività
didattica, restituire nome, cognome e numero di ore totali
dedicate alla didattica [4 punti]*/

SELECT pe.nome, pe.cognome, SUM(oredurata)
FROM persona pe
JOIN attivitanonprogettuale anp
	ON pe.id = anp.persona
WHERE anp.tipo = 'Didattica'
GROUP BY pe.id


-- QUERY 10
/*10. Quali sono le persone che hanno svolto attività nel WP
di id ‘5’ del progetto con id ‘3’. Per ogni persona, restituire
il numero totale di ore svolte in attività progettuali per il
WP in questione [4 punti]*/

SELECT pe.nome, pe.cognome, SUM(ap.oredurata)
FROM persona pe
JOIN attivitaprogetto ap
	ON pe.id = ap.persona
JOIN wp
	ON ap.wp = wp.id
WHERE wp.id = 5 AND wp.progetto = 3
GROUP BY pe.id









