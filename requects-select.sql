# Récupère les prenoms et noms de tous les employes
# 1. SELECT pour effectuer une requète de SELECTion
# 2. On précise les colonnes qu'on souhaite récupérer
# 3. FROM pour indiquer la table concernée.
# SELECT prenom, nom FROM employes

# Afficher les services occupés dans l'entreprise
# On remarque la présence de doublon
#SELECT service FROM employes ;

# Afficher les services occupés dans l'entreprise (sans doublons)
# Le mot clé 'DISTINCT' permet d'éviter les doublons
SELECT DISTINCT service FROM employes ;

# Afficher toutes les données de la table employés
# SELECT prenom, nom, sexe, service, date_embauche, salaire FROM employes
# '*' permet de cibler toutes les colonnes.
#SELECT * FROM employes

#recuperer le prenom de et le nom des employés du service commercial.
#SELECT prenom, nom FROM employes WHERE service = 'commercial';
#récuperer les employés ayant été recruter entre Janvier et mars 2019
SELECT prenom, nom FROM employes
WHERE date_embauche BETWEEN '2019-01-01' AND '2019-03-01';

# recuperer les employes ayant un salaire compris entre 2000 et 3000 euros.
SELECT prenom, nom, salaire FROM employes
WHERE salaire BETWEEN '2000' AND '3000';

#connaitre la date du jour
SELECT CURDATE();

#récuperer les employés ayant été recruter entre Janvier et mars 2019
SELECT prenom, nom, date_embauche FROM employes
WHERE date_embauche BETWEEN '2019-01-01' AND CURDATE();

#recuperer tout les prenoms commençant par la lette 'L'
SELECT prenom FROM employes
WHERE prenom LIKE 'l%';

#recuperer tout les prenoms SE TERMINANT   par la lette 'A'
SELECT prenom FROM employes
WHERE prenom LIKE '%a';

#recuperer tout les employes ayant un prenom contenant la lette 'I'
SELECT prenom FROM employes
WHERE prenom LIKE '%i%';

#Afficher tous les employés sauf ceux du service production
#On utilise l'opérateur !=
SELECT prenom,nom,service FROM employes WHERE service !='production';

#Afficher tous les employés gagnant un salaire supérieur à 3000E.
SELECT prenom,nom,salaire FROM employes WHERE salaire > 3000;

#on utilise le mot clés ORDER BY suivi de ASC pour ascendant et DESC pour descendant.

#Afficher les employés par ordre alphabétique de leur prénom
# SELECT prenom,nom FROM employes ORDER BY prenom ;
 SELECT prenom,nom FROM employes ORDER BY prenom ASC; #ASCENDANT
 SELECT prenom,nom FROM employes ORDER BY prenom DESC; #DESCENDANT
 
 #Quels sont les 3 salariés ayant le meilleur salaire dans l'entreprise ?
 # Grâce à LIMIT, je peux limiter les résultats et introduire la pagination.
 # LIMIT (POSITION DE DEPART) , (NB DE RESULTATS)
 SELECT prenom,nom,service,salaire FROM employes
 ORDER BY salaire DESC LIMIT 0,3 ; #je pars de 0 et je veux 3 résultats
 
  SELECT prenom,nom,service,salaire FROM employes
 ORDER BY salaire DESC LIMIT 3,3 ; #je pars du 3ème et je veux 3 résultats
 
  SELECT prenom,nom,service,salaire FROM employes
 ORDER BY salaire DESC LIMIT 6,3 ; #je pars du 6ème et je veux 3 résultats
 
 #afficher les salariés avec leur salaire annuel
 SELECT nom, prenom, salaire*12 FROM employes; 
 
 #Le mot clé 'AS' permet de nommer une colonne (Donner un alias).
 SELECT nom, prenom, salaire*12 AS salaire_annuel FROM employes;
 
 #Connaitre le montant de la charge salariale ?
 #la fonction SUM() permet d'éffectuer un certain nombre de calcul
 SELECT sum(salaire*12) as masse_salarial_annuelle FROM employes ;
 
 #le salaire moyen ?
 SELECT AVG (salaire) as moyenne_salaire FROM employes;
 
 #Résultat arrondi
 SELECT round(AVG(salaire) ) as moyenne_salaire FROM employes; 
 SELECT round(AVG(salaire),2 ) as moyenne_salaire FROM employes; # 2 chiffre apres la virgule.
 
 #Nombre d'hommes et de femmes de l'entreprise
 SELECT count(*) AS nb_homme FROM employes WHERE sexe = 'h'; 
 SELECT count(*) AS nb_femme FROM employes WHERE sexe = 'f';
 
 # coment trouver le salaire le plus faible de l'entreprise ?
 SELECT prenom,service,salaire FROM employes ORDER BY salaire LIMIT 0,1;
 
 # Pour connaitre l'identité de la personne ayant le salaire le plus faible, il nous faut faire une requete imbriquer car il y a deux requetes ....
 #cette requête est la suivante :
 SELECT prenom, salaire FROM employes WHERE salaire = (SELECT MIN(salaire) FROM employes);
 
 # Récuperer les employes sur le service 'comptabilité' et 'informatique' ?
 SELECT prenom,service FROM employes WHERE service IN ('comptabilite','informatique'); 
 
 #Tous les services SAUF comptabilite ,informatique et production.
 #NOT IN : Qui ne sont pas dans.. il est utiliser pour plusieurs valeurs
 SELECT prenom,service FROM employes WHERE service NOT IN ('comptabilite','informatique','production');
 
 #recuperer les employés du service commercial qui gagnent un salaire supérieur à 2000 euros.
 SELECT prenom,nom,salaire,service FROM employes 
# WHERE service ='commercial'
 #AND salaire >=2000;
WHERE service ='communication'
AND salaire >=3000
and prenom LIKE 'r%';

#recuperer les employés du service commercial qui gagnent un salaire de 2700 ou 3200.
# ici nous avons trois conditions 
# 1. appartenir au service commercial
# 2. Avoir un salaire à 2700
# 3. ou avoir un salaire de 3200

SELECT prenom,nom,serice,salaire FROM employes
WHERE service = 'commercial'
AND (salaire = 2700 OR salaire = 3200 );

#connaitre le nombre d'employes par service ?
SELECT service, COUNT(*) AS nb_employes FROM employes GROUP BY service ;

# connaitre les services ayant plus de 2 personnes.
SELECT service, COUNT(*) AS nb_employes FROM employes 
GROUP BY service HAVING COUNT(*) >2;

#AFFICHER POUR CHAQUE SERVICE L'EMPLOYE AYANT LE MEILLEUR SALAIRE ?

#AFFICHER POUR CHAQUE SERVICE L'EMPLOYE AYANT LE PLUS D'ANCIENNETE ?





 
 
 
 

