# Afficher les livres qui n'ont pas été rendu
# on recherche les livres ayant une date_rendu NULL.
#/!\ IS NULL et non pas = NULL /!\
SELECT id_livre FROM emprunt WHERE date_rendu IS NULL;

#Trouver les titres des livres n'ayant pas été rendus...

SELECT titre FROM livre WHERE id_livre IN (SELECT id_livre FROM emprunt WHERE date_rendu IS NULL);

#recuperer les ID des livres emprunté par chloé ?
SELECT id_livre FROM emprunt where id_abonne = ( select id_abonne FROM abonne where prenom = 'Chloe' );

#affichez les prénom des abonnés ayant emprunter un livre le 19-12-2014
SELECT prenom FROM abonne 
WHERE id_abonne IN ( SELECT id_abonne FROM emprunt WHERE date_sortie = '2014-12-19');


#afficher la liste des abonnés ayant déjà emprunté un livre d'Alphonse DAUDET ?
SELECT prenom FROM abonne WHERE id_abonne IN ( SELECT id_abonne FROM emprunt WHERE id_livre IN ( SELECT id_livre FROM livre WHERE auteur = 'ALPHONSE DAUDET'	) ) ;

# Afficher le(s) titre de(s) livre(s) que Chloé n'a pas encore emprunté à la bibliothèque ?
SELECT titre FROM livre where id_livre NOT IN ( select id_livre FROM emprunt WHERE id_abonne  in ( select id_abonne FROM abonne Where prenom = 'Chloe' ) );


# Afficher le(s) titre de(s) livre(s) que Chloé n'a pas encore rendu(s) à la bibliothèque.
SELECT titre FROM livre WHERE id_livre IN (SELECT id_livre FROM emprunt WHERE date_rendu IS NULL AND id_abonne = ( SELECT id_abonne FROM abonne WHERE prenom = 'chloe'));

# Combien de livre Guillaume a emprunté à la bibliotheque ?
SELECT COUNT(*) AS 'nb livre' FROM emprunt where id_abonne = ( select id_abonne FROM abonne where prenom = 'Guillaume' );
