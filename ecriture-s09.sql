-- Active: 1795077965271@@127.0.0.1@3306@miniforum_daniel
-- ============================================================
--  TP semaine 9 -- Écrire dans le forum
--  Fichier à copier dans le dossier db/ de ton dépôt MiniForum,
--  sous le nom db/ecriture-s09.sql, puis à compléter.
--
--  Sous chaque numéro : la requête qui a DONNÉ le résultat annoncé
--  dans la fiche TP. Une requête refusée exprès (un « piège ») se
--  garde aussi, avec le numéro de l'erreur en commentaire.
--
--  Base : miniforum_prenom. Les requêtes s'enchaînent : exécute-les
--  dans l'ordre, une seule fois chacune.
--  Rappel : une apostrophe dans un texte s'écrit deux fois  ->  'J''ai'
-- ============================================================

-- ------------------------------------------------------------
-- Étape 2 -- S'inscrire
-- ------------------------------------------------------------
-- 2.1 nora s'inscrit (pseudo et e-mail seulement)

INSERT INTO users (pseudo,email)
VALUES ('nora','nora.t@cfpt.ch');

-- 2.2 vérifier son inscription

SELECT * FROM users WHERE pseudo='nora';
-- Parce-que le type de "cree_le" est datetime et sa valeur par défaut est current_timestamp(), qui est l'heure en direct.

-- ------------------------------------------------------------
-- Étape 3 -- Publier un sujet et deux réponses
-- ------------------------------------------------------------
-- 3.1 nora ouvre un sujet
INSERT INTO topics (titre,idUser)
VALUES ('Peut-on annuler un DELETE ?',11);

-- 3.2 nora écrit le premier message de son sujet

INSERT INTO posts(contenu,idTopic,idUser)
VALUES ('J''ai lancé un DELETE sans WHERE sur ma copie. Peut-on revenir en arrière ?',21,11);

-- 3.3 sarah répond dans le sujet de nora

INSERT INTO posts(contenu, idTopic,idUser)
VALUES ('Non, il n''y a pas de bouton Annuler. Seule une sauvegarde te sauve : un export .sql, par exemple.',21,2);

-- 3.4 nora répond dans le sujet 4

INSERT INTO posts(contenu, idTopic, idUser)
VALUES ('Pour moi, c''était une apostrophe dans un texte.',4,11);

-- 3.5 vérifier les messages du sujet de nora

SELECT * FROM posts WHERE idTopic=21;

-- ------------------------------------------------------------
-- Étape 4 -- Aimer, puis ne plus aimer
-- ------------------------------------------------------------
-- 4.1 nora aime la réponse de sarah

INSERT INTO likes(idUser,idPost)
VALUES (11,82);

-- 4.2 nora aime les messages 1 et 2, en une seule requête
INSERT INTO likes(idUser, idPost)
VALUES (11,1),(11,2);

-- 4.3 nora aime une seconde fois la réponse de sarah (erreur : numéro ?)

--INSERT INTO likes(idUser,idPost)
--VALUES (11,82);
--Erreur 1062 car duplication du champ 11-82 : idUser est une clé primiaire et cet id ne peut pas être deux fois dans les likes.

-- 4.4 vérifier que ce « j'aime » existe déjà

SELECT * FROM likes WHERE idUser=11 AND idPost=82;

-- 4.5 nora aime le message 99 (erreur : numéro ?)

--INSERT INTO likes(idUser,idPost)
--VALUES (11,99);

-- 4.6 vérifier que le message 99 existe

SELECT * FROM likes WHERE idPost=99;

-- 4.7 nora n'aime plus le message 2

DELETE FROM likes WHERE idUser=11 AND idPost=2;

-- 4.8 vérifier les « j'aime » de nora

SELECT * FROM likes WHERE idUser=11;

-- ------------------------------------------------------------
-- Étape 5 -- Corriger un message, renommer un membre
-- ------------------------------------------------------------
-- 5.1 nora corrige son message dans le sujet 4

UPDATE posts
SET contenu='Pour moi, c''était une apostrophe dans un texte : il faut l''écrire deux fois.'
WHERE idPost=83;

-- 5.2 vérifier la correction

SELECT * FROM posts WHERE idPost=83;

-- 5.3 nora change de pseudo et d'adresse, en une seule requête

UPDATE users
SET pseudo='nora_dev',email='nora.dev@cfpt.ch'
WHERE idUser=11;

-- 5.4 nora prend l'adresse de sarah (erreur : numéro ?)

--UPDATE users
--SET email='sarah.n@cfpt.ch'
--WHERE idUser=11;
-- Erreur numéro 1062 car l'email de Sarah ne peut pas être dupliqué dans un autre utilisateur (clé unique).

-- 5.5 vérifier son compte

SELECT * FROM users WHERE idUser=11;

-- ------------------------------------------------------------
-- Étape 6 -- Supprimer
-- ------------------------------------------------------------
-- 6.1 avant : les « j'aime » de la réponse de sarah

SELECT * FROM likes WHERE idPost=82;

-- 6.2 supprimer la réponse de sarah

DELETE FROM posts WHERE idPost=82;

-- 6.3 après : les « j'aime » de la réponse de sarah

SELECT * FROM likes WHERE idPost=82;

-- 6.4 supprimer nora (erreur : numéro ? quelle table ?)

--DELETE FROM users WHERE idUser=11;
--Erreur 1451 : impossibilité de supprimer le parent car nora a encore un sujet et des messages

-- 6.5 supprimer tous les messages de nora

DELETE FROM posts WHERE idUser=11;

-- 6.6 supprimer nora, deuxième essai (erreur : numéro ? quelle table ?)

-- DELETE FROM users WHERE idUser=11;
--Erreur 1451 : même erreur qu'avant car impossibilité de supprimer le parent si nora a encore des messages

-- 6.7 supprimer le sujet de nora

DELETE FROM topics WHERE titre='Peut-on annuler un DELETE ?';

-- 6.8 supprimer nora, troisième essai

DELETE FROM users WHERE idUser=11;

-- Les nombres de lignes de la base redeviennent ceux par défaut

-- 6.9 vérifier qu'il ne reste aucun « j'aime » de nora

SELECT * FROM likes WHERE IdUser=11;

-- Il ne reste plus aucun like de Nora car cet utilisateur a bien été supprimé et les likes sont parti avec

-- ------------------------------------------------------------
-- Étape 7 -- Le WHERE oublié, sur la copie miniforum_copie
-- ------------------------------------------------------------
-- 7.2 la copie a-t-elle gardé ses clés étrangères ? (erreur attendue)

--DELETE FROM users WHERE pseudo='malik';
-- Même erreur 1451 quand on a vu avant : les clés étrangères sont toujours présentes dans la copie

-- 7.3 renommer lucas... sans WHERE

UPDATE users
SET pseudo='lucas_g';

-- 7.4 vérifier les pseudos

SELECT * FROM users;

-- Tout le monde s'appelle maintenant Lucas

-- 7.5 « chloe n'aime plus le message 2 »... avec une seule condition

DELETE FROM likes WHERE idUser=5;

-- On a par erreur supprimé tous les likes de Chloé au lieu de seulement le like du message 2

-- 7.6 supprimer tous les membres (erreur : numéro ?)

DELETE FROM users;
--Erreur 1451 à nouveau : il reste encore plusieurs utilisateurs qui ont des clés étrangères.

-- 7.7 supprimer tous les sujets

DELETE FROM topics;
-- On a au final supprimé tous les suejets au lieu d'un car on a pas spécifié lequel avec "WHERE";

-- 7.8 dans miniforum_prenom (pas la copie) : lucas existe-t-il toujours ?

SELECT * FROM users WHERE pseudo='lucas';
-- Le résultat nous affiche bien l'utilisateur Lucas à la ligne 9 car les commandes faites sur la copie n'a eu aucun effet sur la base de donnée originale.
