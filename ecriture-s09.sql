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

-- 2.2 vérifier son inscription


-- ------------------------------------------------------------
-- Étape 3 -- Publier un sujet et deux réponses
-- ------------------------------------------------------------
-- 3.1 nora ouvre un sujet

-- 3.2 nora écrit le premier message de son sujet

-- 3.3 sarah répond dans le sujet de nora

-- 3.4 nora répond dans le sujet 4

-- 3.5 vérifier les messages du sujet de nora


-- ------------------------------------------------------------
-- Étape 4 -- Aimer, puis ne plus aimer
-- ------------------------------------------------------------
-- 4.1 nora aime la réponse de sarah

-- 4.2 nora aime les messages 1 et 2, en une seule requête

-- 4.3 nora aime une seconde fois la réponse de sarah (erreur : numéro ?)

-- 4.4 vérifier que ce « j'aime » existe déjà

-- 4.5 nora aime le message 99 (erreur : numéro ?)

-- 4.6 vérifier que le message 99 existe

-- 4.7 nora n'aime plus le message 2

-- 4.8 vérifier les « j'aime » de nora


-- ------------------------------------------------------------
-- Étape 5 -- Corriger un message, renommer un membre
-- ------------------------------------------------------------
-- 5.1 nora corrige son message dans le sujet 4

-- 5.2 vérifier la correction

-- 5.3 nora change de pseudo et d'adresse, en une seule requête

-- 5.4 nora prend l'adresse de sarah (erreur : numéro ?)

-- 5.5 vérifier son compte


-- ------------------------------------------------------------
-- Étape 6 -- Supprimer
-- ------------------------------------------------------------
-- 6.1 avant : les « j'aime » de la réponse de sarah

-- 6.2 supprimer la réponse de sarah

-- 6.3 après : les « j'aime » de la réponse de sarah

-- 6.4 supprimer nora (erreur : numéro ? quelle table ?)

-- 6.5 supprimer tous les messages de nora

-- 6.6 supprimer nora, deuxième essai (erreur : numéro ? quelle table ?)

-- 6.7 supprimer le sujet de nora

-- 6.8 supprimer nora, troisième essai

-- 6.9 vérifier qu'il ne reste aucun « j'aime » de nora


-- ------------------------------------------------------------
-- Étape 7 -- Le WHERE oublié, sur la copie miniforum_copie
-- ------------------------------------------------------------
-- 7.2 la copie a-t-elle gardé ses clés étrangères ? (erreur attendue)

-- 7.3 renommer lucas... sans WHERE

-- 7.4 vérifier les pseudos

-- 7.5 « chloe n'aime plus le message 2 »... avec une seule condition

-- 7.6 supprimer tous les membres (erreur : numéro ?)

-- 7.7 supprimer tous les sujets

-- 7.8 dans miniforum_prenom (pas la copie) : lucas existe-t-il toujours ?

