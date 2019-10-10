# Afficher le service de l'employé 5.
# Afficher la date d'embauche de : Melissa.
# Afficher le nombre de commerciaux.
# Afficher le coût des commerciaux sur 1 année.
# Afficher le salaire moyen par service.
# Afficher le nombre de recrutements sur l'année 2019.
# Augmenter le salaire pour chaque employé de 100€.
# Afficher les informations de l'employé du service commercial gagnant le salaire le plus élevé
# Afficher l'employé ayant été embauché en dernier.

------------------------------------------------------------------------------------------------
#1 # Afficher le service de l'employé 5.
SELECT service FROM employes WHERE id_employes = 5;
 
 #2 Afficher la date d'embauche de : Melissa.
 SELECT date_embauche FROM employes WHERE prenom = 'mélissa' ;
 
 #3Afficher le nombre de commerciaux
 SELECT COUNT(*) AS nb_commerciaux FROM employes WHERE service ='commercial';


 #4# Afficher le coût des commerciaux sur 1 année.
	SELECT sum(SALAIRE*12)AS cout_des_commerciaux FROM employes WHERE service = 'commercial';
 
 #5# Afficher le salaire moyen par service.
SELECT service,AVG (salaire) as moyenne_salaire FROM employes GROUP BY service;

#6 Afficher le nombre de recrutements sur l'année 2019.
SELECT COUNT(*) AS nb_recrutement FROM employes WHERE date_embauche between '2019-01-01' AND '2019-12-31';

#7# Augmenter le salaire pour chaque employé de 100€.
UPDATE employes SET salaire = salaire + 500;

#8Afficher les informations de l'employé du service commercial gagnant le salaire le plus élevé
SELECT prenom,nom,salaire,service,date_embauche,sexe FROM employes WHERE service ='commercial' AND salaire = (SELECT Max(salaire) FROM employes # where service ='commercial'
 );

#9  Afficher l'employé ayant été embauché en dernier.
SELECT * FROM employes WHERE date_embauche = ( SELECT MAX (date_embauche) FROM employes ) ;



 
 
 