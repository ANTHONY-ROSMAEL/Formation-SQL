CREATE TABLE abonne ( 
`id_abonne` int(3) NOT NULL AUTO_INCREMENT,
`prenom` varchar(20) NOT NULL,
primary key (`id_abonne`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE livre (
`id_livre`int(3) NOT NULL AUTO_INCREMENT,
`auteur` varchar(30) NOT NULL,
`titre` varchar (30) NOT NULL,
primary key (`id_livre`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE emprunt (
`id_emprunt`int(3) NOT NULL AUTO_INCREMENT,
`id_livre` int(3) DEFAULT NULL,
`id_abonne` int(3) DEFAULT NULL,
`date_sortie`  DATE NOT NULL,
`date_rendu` DATE DEFAULT NULL, 
primary key (`id_emprunt`)
 )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
 # La création des contraintes se fait généralement après la création des tables.
 # vue que les tables sont déjà créées, on va devoir les modifiers.
 # ALTER TABLE : modifier la table 
 # ADD FOREING KEY :Ajouter une contrainte de clé étrangère.
 
 ALTER TABLE emprunt ADD FOREIGN KEY (`id_livre`) REFERENCES livre (`id_livre`);
 ALTER TABLE emprunt ADD FOREIGN KEY (`id_abonne`) REFERENCES abonne (`id_abonne`);
 