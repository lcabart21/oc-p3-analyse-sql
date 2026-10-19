-- Projet 3 — 12 requêtes d'analyse sur la base d'assurance habitation (SQLite)
-- Transcrites des captures d'exécution (DB Browser for SQLite) du livrable 2.

-- Requête 1 : contrats et surface pour la commune de Caen
SELECT Contrat_ID, Surface
FROM Contrat
JOIN Region USING (Code_dep_code_commune)
WHERE LOWER(com_nom_maj_court) = 'caen';

-- Requête 2 : contrats, type de contrat et formule pour les maisons du département 71
SELECT Contrat_ID, dep_code, Type_contrat, Type_local, Formule
FROM Contrat
JOIN Region USING (Code_dep_code_commune)
WHERE dep_code = '71'
  AND Type_local = 'Maison';

-- Requête 3 : liste des régions de France
SELECT DISTINCT reg_nom
FROM Region;

-- Requête 4 : les 5 contrats aux surfaces les plus élevées
SELECT Contrat_ID, Surface
FROM Contrat
ORDER BY Surface DESC
LIMIT 5;

-- Requête 5 : prix moyen de la cotisation mensuelle   (résultat : 19,33 €)
SELECT AVG(Prix_cotisation_mensuel) AS prix_moyen_cotisation
FROM Contrat;

-- Requête 6 : nombre de contrats par catégorie de valeur déclarée des biens
SELECT Valeur_declaree_biens, COUNT(Contrat_ID) AS nb_contrat
FROM Contrat
GROUP BY Valeur_declaree_biens;

-- Requête 7 : nombre de formules « Integral » en Pays de la Loire   (résultat : 589)
SELECT reg_nom, COUNT(Contrat_ID) AS nb_contrat
FROM Contrat
LEFT JOIN Region USING (Code_dep_code_commune)
WHERE Formule = 'Integral'
  AND reg_nom = 'Pays de la Loire';

-- Requête 8 : contrats des maisons du département 71 (variante de la requête 2 demandée dans la liste)
SELECT Contrat_ID, dep_code, Type_contrat, Type_local, Formule
FROM Contrat
JOIN Region USING (Code_dep_code_commune)
WHERE dep_code = '71'
  AND Type_local = 'Maison';

-- Requête 9 : surface moyenne des contrats à Paris   (résultat : 51,8 m²)
SELECT dep_nom, AVG(Surface) AS surface_moy
FROM Contrat
LEFT JOIN Region USING (Code_dep_code_commune)
WHERE dep_nom = 'Paris';

-- Requête 10 : top 10 des départements à la cotisation moyenne la plus élevée   (Paris en tête : 36,40 €)
SELECT dep_nom, AVG(Prix_cotisation_mensuel) AS cotisation_moy
FROM Contrat
LEFT JOIN Region USING (Code_dep_code_commune)
GROUP BY dep_nom
ORDER BY cotisation_moy DESC
LIMIT 10;

-- Requête 11 : communes ayant au moins 150 contrats   (Paris 18e en tête : 515)
SELECT com_nom_maj_court, COUNT(Contrat_ID) AS nb_contrat
FROM Contrat
LEFT JOIN Region USING (Code_dep_code_commune)
GROUP BY com_nom_maj_court
HAVING nb_contrat >= 150
ORDER BY nb_contrat DESC;

-- Requête 12 : nombre de contrats par région
SELECT reg_nom, COUNT(Contrat_ID) AS nb_contrat
FROM Contrat
LEFT JOIN Region USING (Code_dep_code_commune)
GROUP BY reg_nom
ORDER BY reg_nom ASC;
