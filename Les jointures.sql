#Afficher les dates auxquelles Guillaume s'est rendu à la bibliothèque pour emprunter ou pour rendre un livre.
# on veut recuperer 3 informations : date de sortie et de rendu, prenom de guillaume

SELECT a.prenom, e.date_sortie, e.date_rendu
FROM abonne a, emprunt e
WHERE a.id_abonne=e.id_abonne
AND a.prenom='guillaume';

# afficher les dates auquelles les livres écrits par alphonse daubet ont été empruntés ou rendu à la biblioteque.
SELECT e.date_sortie, e.date_rendu
FROM livre l, emprunt e
where  l.id_livre = e.id_livre
AND l.auteur ='ALPHONSE DAUDET';

#Qui a emprunté le livre 'Une vie ' sur l'année 2014 ?
SELECT a.prenom
FROM livre l, emprunt e, abonne a
where  l.id_livre = e.id_livre
AND e.id_abonne = a.id_abonne
AND l.titre = 'Une vie'
AND e.date_sortie LIKE '2014%' ; 


#Afficher le nombre de livres empruntés par chaque abonné
SELECT a.prenom, COUNT(e.id_livre) AS 'nombre de livre emprunte'
FROM abonne a, emprunt e
WHERE a.id_abonne=e.id_abonne
GROUP BY e.id_abone;

					#JOINTURE EXTERNE 

#Afficher le prénom des abonnés avec le numero des livres qu'ils ont emprunté
# left join prendra en compte aussi les personnes qui n'ont jamais empreinter de livre, sans celle ci l'abonné 'rosmael' ne serait pas afficher .
SELECT a.prenom, e.id_livre
FROM abonne a LEFT JOIN emprunt e
ON a.id_abonne = e.id_abonne;