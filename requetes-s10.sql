-- Active: 1795077965271@@127.0.0.1@3306@miniforum_daniel
-- ============================================================
--  MiniForum -- requêtes de la semaine 10
--  À copier dans le dossier db/ de ton dépôt, puis à compléter.
--
--  Base : miniforum_prenom (10 membres, 20 sujets, 80 messages,
--  35 « j'aime »). Pour chaque question :
--    1. écris la requête dans l'onglet SQL de phpMyAdmin ;
--    2. compare le résultat au crochet de la fiche TP ;
--    3. résultat juste : colle la requête sous son numéro.
--  Les explications demandées s'écrivent en commentaires (--).
--  Les requêtes fautives à provoquer (6.1, 5.9, 6.9 a) restent
--  en commentaire : le fichier entier doit s'exécuter sans erreur.
--
--  Pas de numéro écrit à la main dans un WHERE : à l'étape 6,
--  c'est une sous-requête qui le trouve.
--
--  Ce fichier ne fait que LIRE la base : aucune requête ne la modifie.
-- ============================================================

-- ---------- Étape 2 -- Choisir -------------------------------------

-- 2.1 Le pseudo et l'e-mail de tous les membres.            [10 lignes]
SELECT pseudo, email
FROM users;

-- 2.2 L'e-mail de lea.                                  [lea.p@cfpt.ch]
SELECT email
FROM users
WHERE pseudo='lea';

-- 2.3 Date de création du sujet « Erreur 1064, que faire ? ». [2025-10-04 09:10:00]
SELECT cree_le
FROM topics
WHERE titre='Erreur 1064, que faire ?';

-- 2.4 Pseudo et date d'inscription des membres inscrits en 2026. [2 lignes]
SELECT pseudo, cree_le
FROM users
WHERE cree_le >= '2026-01-01'

-- 2.5 Numéro et date des messages publiés depuis le 12 janvier 2026. [2 lignes]
SELECT idPost, cree_le
FROM posts
WHERE cree_le >= '2026-01-12'

-- 2.6 Membres inscrits avant le 5 septembre 2025 ou depuis le
SELECT pseudo, cree_le
FROM users
WHERE NOT pseudo='malik' AND (cree_le < '2025-09-05' OR cree_le >= '2026-01-01');
--     1er janvier 2026, sauf malik.
--     (a) sans parenthèses                                   [5 lignes]
--     (b) corrigée                                           [4 lignes]
--     Pourquoi malik était là :


-- ---------- Étape 3 -- Trier, couper, chercher ---------------------

-- 3.1 Titre et date des 5 sujets les plus récents.           [5 lignes]
SELECT titre, cree_le
FROM topics
ORDER BY cree_le DESC
LIMIT 5;

-- 3.2 Les pseudos par ordre alphabétique.                   [10 lignes]
SELECT pseudo
FROM users
ORDER BY pseudo;

-- 3.3 Les pseudos des 3 premiers inscrits.          [malik, sarah, lea]
SELECT pseudo
FROM users
ORDER BY cree_le
LIMIT 3;

-- 3.4 Les titres qui contiennent « git ».                    [3 lignes]
SELECT titre 
FROM topics
WHERE titre LIKE '%git%';

-- 3.5 Les titres qui se terminent par « ? ».                 [5 lignes]
SELECT titre 
FROM topics
WHERE titre LIKE '%?';

-- 3.6 Titre et date des sujets de décembre 2025, avec BETWEEN. [4 lignes]
SELECT titre, cree_le
FROM topics
WHERE cree_le BETWEEN '2025-12-01' AND '2025-12-31';

-- 3.7 Numéro et date des messages du 18 septembre 2025.

SELECT idPost, cree_le
FROM posts
WHERE cree_le LIKE '2025-09-18%';
--     (a) avec BETWEEN '2025-09-18' AND '2025-09-18'          [0 ligne]
--     (b) corrigée, sans BETWEEN                             [5 lignes]
--     Pourquoi (a) ne trouve rien :


-- 3.8 Pseudo et e-mail de sarah, lea et zoe, avec IN.        [2 lignes]
SELECT pseudo, email
FROM users
WHERE pseudo IN ('sarah','lea','zoe');

-- 3.9 Les numéros des membres qui ont ouvert un sujet, une fois. [9 lignes]
SELECT DISTINCT idUser
FROM topics
--     Le numéro qui manque :


-- ---------- Étape 4 -- Compter -------------------------------------

-- 4.1 Le nombre de messages, colonne nb_messages.                  [80]


-- 4.2 Date du premier et du dernier message.
--                           [2025-09-18 14:32:00 | 2026-01-15 18:20:00]


-- 4.3 Le nombre de messages publiés en 2026.                       [12]


-- 4.4 Le nombre de membres différents qui ont écrit.                [9]


-- 4.5 Longueur moyenne d'un message, total des caractères. [90.7000 | 7256]


-- 4.6 SELECT idUser, COUNT(*) FROM posts;                      [1 | 80]
--     Malik a-t-il écrit 80 messages ? Ce que la base a fait :


-- ---------- Étape 5 -- Regrouper -----------------------------------

-- 5.1 Nombre de messages par sujet (colonne nb_messages).   [18 lignes]


-- 5.2 La même, du plus discuté au moins discuté.       [1 | 10 en tête]


-- 5.3 Les sujets qui ont plus de 5 messages.                 [4 lignes]


-- 5.4 Nombre de messages par membre, du plus actif. [9 lignes, 1 | 14 en tête]


-- 5.5 Les membres qui ont écrit au moins 10 messages.        [4 lignes]


-- 5.6 Nombre de « j'aime » par message, le plus aimé d'abord.
--                                            [25 lignes, 1 | 6 en tête]


-- 5.7 Messages par sujet, depuis le 1er janvier 2026.        [6 lignes]


-- 5.8 L'énigme : 18 lignes pour 20 sujets.
--     Les numéros de sujet présents dans posts :            [18 lignes]
--     Les sujets qui manquent, et pourquoi :


-- 5.9 5.3 écrite avec WHERE COUNT(*) > 5 (garder en commentaire). [#1111]


-- ---------- Étape 6 -- Demander le numéro à la base ----------------

-- 6.1 Les titres des sujets de malik.
--     La requête fautive (garder en commentaire) :              [#1054]
--     Corrigée, avec une sous-requête :                      [3 lignes]
--     Pourquoi l'erreur :


-- 6.2 Le nombre de messages écrits par malik.                      [14]


-- 6.3 Numéro et date des messages du sujet
--     « Ma page est illisible sur mobile ».                  [6 lignes]


-- 6.4 Numéro des messages de sarah dans « Git refuse mon push ». [2 lignes]


-- 6.5 Le dernier message publié, sans ORDER BY.
--                                        [80 | 2026-01-15 18:20:00 | 9]


-- 6.6 Numéro et sujet des messages des sujets dont le titre
--     contient « git », avec IN.                            [18 lignes]


-- 6.7 Numéro et titre des sujets sans aucun message, avec NOT IN. [2 lignes]


-- 6.8 Le pseudo du membre qui n'a ouvert aucun sujet.           [chloe]


-- 6.9 Le nombre de messages de sarah et lea, ensemble.
--     (a) avec = (garder en commentaire)                        [#1242]
--     (b) corrigée                                                 [21]
--     Pourquoi l'erreur :


-- ---------- Étape 7 -- La page d'accueil en SQL --------------------

-- 7.1 Sujets récents : numéro, titre, date, auteur des 5 derniers.
--                                                [5 lignes, 20 en tête]


-- 7.2 Discussions actives : nombre de messages et date du dernier
--     message, les 5 plus récents.      [5 lignes : 17, 18, 15, 12, 16]


-- 7.3 Membres les plus actifs : les 3 premiers, à égalité le plus
--     petit numéro.                            [1 | 14, 2 | 11, 3 | 10]
--     Pourquoi un second critère de tri :


-- 7.4 Pied de page : nombre de messages et de membres auteurs. [80 | 9]


-- ---------- Pour aller plus loin (facultatif) ---------------

-- +1 Sujets par année.                            [2025 : 13, 2026 : 7]


-- +2 « J'aime » donnés par membre, du plus généreux. [9 lignes, 5 | 7 en tête]


-- +3 Les membres qui ont ouvert plus d'un sujet.             [7 lignes]


-- +4 Le membre qui n'a jamais donné de « j'aime ».             [alicia]
