# J'augmente à 5000 euros le salaire de l'employe ID 1
#1 UPDATE : mise à jour 
#2 Suivi de la table 
#3 SET suivi de la colonne à modifier 
#4 (option) une condition WHERE.
UPDATE employes SET salaire = 5500 WHERE id_employes = 1;

#Augmenter de 20% tous les salaires sauf celui de la direction ?

UPDATE employes SET salaire = salaire * (1 + 20 / 100)  WHERE service != 'direction' ;
