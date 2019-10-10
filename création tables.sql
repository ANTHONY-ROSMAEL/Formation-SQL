# pour faire un commentaire on utilse '#'
#ON crée la table emplyer uniquement si elle nexiste pas deja
CREATE TABLE IF not exists employes (
# Ici je vais préciser les colonnes de ma table :
# 1. Nom de ma colonne
# 2.le type de la colonne
# 3. NULL / NOT NULL
# 4.Si auto_increment ecrire AUTO_INCREMENT
# default permet de donner une valeur par default
`id_employes` int(3) NOT NULL AUTO_INCREMENT,
`prenom` varchar(20) NOT NULL,
`nom` varchar(20)NOT NULL,
`sexe` enum('h','f')NOT NULL,
`service` varchar(30) DEFAULT NULL,
`date_embauche` date DEFAULT NULL,
`salaire` float DEFAULT NULL,
primary key (`id_employes`)
# inoDB permet de bénéficier des relations avec les FK
# myIsam n'inclu pas la gestion des FK.
# chercher innoDB et MyIsam
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
