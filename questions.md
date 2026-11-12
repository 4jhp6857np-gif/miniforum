Semaine 8
7.1
a. Il en contient trois de requêtes INSERT INTO sur les tables topics, posts et likes. Les données sont dans l'ordre croissant des idTopics de chaque table.
b. Le sujet 1 est 'Git refuse mon push'. L'idUser qui l'a ouvert est le numéro 1, c'est-à-dire Malik.
c. Les tables sont dans cette ordre-là car chaque table suivante a besoin de l'id de la liste de la/les table qui se trouve(nt) avant...
d. Elle ne contien aucun INSERT INTO users car c'est l'utilisateur qui va rentrer ces informations sur le site du miniforum.
7.3
Le numéro de l'erreur est 1062. Les nombres de lignes ont beaucoup augmenté pour chaque table car ils ont chacun pris en compte les données concernant le non des sujets de publication, le contenu de ces derniers et le nombre de likes pour chaque publication.
(Pas la correection)
9.1
Le numéro d'erreur est 1062 car cette donnée existe déjà dans la table likes.
9.2
Le message d'erreur est : "1451 - Cannot delete or update a parent row: a foreign key constraint fails". Cela veut dire que cet utilisateur est relié à une clé étrangère venant d'une autre table.
9.3
a. Son idTopic et 21.
b. L'erreur affiché est : "1366 - Incorrect integer value: '' for column `miniforum_daniel`.`posts`.`idTopic` at row 1". J'avais oublié de rajouter le sujet et ça me dit maintenant "1 ligne insérée. Identifiant de la ligne insérée : 81"
c. "1 ligne insérée."
d. Nombre de ligne de likes : 36. Nombre de lignes de posts : 81. Nombre de lignes de topics : 21. Nombre de lignes de users : 10. Après la suppression du sujet d'essai, les nombres de lignes sont 35, 80, 20 et 10 (soustraction de 1 sauf pour users)
10.1
Il contient 5 ADD CONSTRAINT. Ils sont vers la fin du fichier, dans "ALTER TABLE" des trois tables (autre que users) pour ajouter les nouvelles publications insérées.
10.2
AUTO_INCREMENT est égal à 82, 22 et 11. Car il faut additionner un à chaque nombre après la nouvelle publication.
10.3
Non, elle ne contient pas mon mot de passe pour des questions de sécurité