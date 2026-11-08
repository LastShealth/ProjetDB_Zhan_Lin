-- SECTION 1 : PROJECTIONS ET SÉLECTIONS
-- 1.1 Productions TV ou Film actuellement en production ou planifiées,des plus chères aux moins chères 
SELECT titre_anime, format,etat, budget 
FROM Anime 
WHERE format  IN  ('TV', 'Film') 
AND etat IN  ('En production', 'Planifié')  
ORDER BY budget DESC;

-- 1.2 Liste des formats de production réellement utilisés par le studio,
SELECT DISTINCT format
FROM Anime 
ORDER BY format; 

-- 1.3 Mangas dont le titre contient « Titan » ou commence par « D »
SELECT Titre, Nombre_de_Tomes, Date_de_publication
FROM Manga
WHERE Titre LIKE '%Titan%'
OR Titre LIKE  'D%'
ORDER BY Titre; 

-- 1.4 Employés embauchés entre 2005 et 2020, du plus ancien au plus récent
SELECT nom_employe, prenom_employe, role_employe, date_embauche
FROM Employe
WHERE date_embauche BETWEEN '2005-01-01' AND '2020-12-31'
ORDER BY date_embauche ASC, nom_employe ASC;

-- 1.5 Grosses dépenses (entre 100 000 et 400 000 yens) de type Salaires, Musique ou Marketing 
SELECT ID_depense, ID_anime, categorie_depense, montant, motif
FROM Depense
WHERE categorie_depense IN ('Salaires', 'Musique', 'Marketing')
AND montant BETWEEN 100000 AND 400000
ORDER BY montant DESC;

-- 1.6 Contrats de diffusion de plateformes Streaming ou Web signés entre 2010 et 2025, classés par montant décroissant
SELECT nom_diffuseur, type_diffuseur, date_debut_droit, date_fin_diffusion, montant_contrat
FROM  Diffuseur
WHERE type_diffuseur  IN ('Streaming', 'Web')
AND date_debut_droit BETWEEN '2010-01-01' AND '2025-12-31'
ORDER BY montant_contrat DESC;

-- 1.7 Prestataires dont la spécialité contient « Animation » et dont le nom est trié alphabétiquement 
SELECT nom_prestataire, specialite
FROM  Prestataire
WHERE specialite LIKE '%Animation%'
ORDER BY nom_prestataire;

-- SECTION 2 : FONCTIONS D'AGRÉGATION 
-- 2.1 Nombre de productions par format
SELECT format, COUNT(*)  AS nb_productions 
FROM Anime
GROUP BY  format 
ORDER BY  nb_productions DESC;

-- 2.2 Budget moyen, minimum et maximum par état d'avancement
SELECT etat, COUNT(*) AS nb_productions,
ROUND(AVG(budget), 2) AS budget_moyen,
MIN(budget) AS budget_min,
MAX(budget) AS budget_max
FROM Anime
GROUP BY etat;

-- 2.3 Total des dépenses par production, uniquement celles qui dépassent 100 000 yens
SELECT a.titre_anime,
SUM(d.montant) AS total_depenses
FROM Anime a 
JOIN Depense d ON d.ID_anime = a.ID_anime 
GROUP BY  a.ID_anime, a.titre_anime
HAVING SUM(d.montant) > 100000
ORDER BY total_depenses DESC;

-- 2.4 Répartition des dépenses par catégorie total, moyenne, nombre
SELECT categorie_depense,
COUNT(*) AS nb_depenses,
SUM(montant) AS total,
ROUND(AVG(montant), 2) AS moyenne
FROM Depense
GROUP BY categorie_depense
ORDER BY total DESC;

-- 2.5 Charge de travail : employés ayant cumulé au moins 50 heures sur l'ensemble des épisodes
SELECT e.nom_employe, e.prenom_employe,
SUM(p.nb_heure) AS total_heures
FROM Employe  e 
JOIN  Participer_tache p ON p.ID_employe = e.ID_employe
GROUP BY e.ID_employe, e.nom_employe, e.prenom_employe
HAVING  SUM(p.nb_heure) >= 50
ORDER BY total_heures DESC;

-- 2.6 Montant total et moyen des contrats par type de diffuseur, pour les types ayant au moins 2 contrats
SELECT type_diffuseur, COUNT(*) AS nb_contrats,
SUM(montant_contrat) AS total_contrats,
ROUND(AVG(montant_contrat),2) AS contrat_moyen
FROM Diffuseur
GROUP BY type_diffuseur
HAVING COUNT(*) >= 2;

-- 2.7 Pour chaque production : nombre de saisons, d'épisodes et durée totale en minutes
SELECT a.titre_anime, COUNT(DISTINCT s.ID_saison) AS nb_saisons,
COUNT(e.ID_episode) AS nb_episodes,
SUM(e.duree)  AS duree_totale_min
FROM Anime a
JOIN Saison s  ON s.ID_anime  = a.ID_anime
JOIN Episode e ON e.ID_saison = s.ID_saison
GROUP BY a.ID_anime, a.titre_anime
HAVING COUNT(e.ID_episode) >= 10
ORDER BY nb_episodes DESC;

-- 2.8 Genres les plus représentés parmi les mangas
SELECT g.genre, COUNT(*) AS nb_mangas,
ROUND(AVG(m.Nombre_de_Tomes),1) AS tomes_moyen
FROM Genre g
JOIN Manga_Genre mg ON mg.ID_genre = g.ID_genre
JOIN Manga m ON m.ID_manga  = mg.ID_manga
GROUP BY g.ID_genre, g.genre
HAVING COUNT(*) >= 2
ORDER BY nb_mangas DESC;

-- SECTION 3 : JOINTURES 
-- 3.1 Fiche complète d'une production : manga source, auteur, éditeur et réalisateur
SELECT a.titre_anime, a.format, a.etat,r.Nom_Realisateur,m.Titre AS manga_source, au.Nom  AS auteur,ed.nom_editeur
FROM Anime a
JOIN  Realisateur r ON r.ID_Realisateur = a.ID_Realisateur
LEFT JOIN Manga m ON m.ID_manga= a.ID_manga
LEFT JOIN  Auteur au ON au.ID_auteur = m.ID_auteur
LEFT JOIN Editeur ed  ON ed.ID_editeur = m.ID_editeur
ORDER BY a.titre_anime;

-- 3.2 Mangas jamais adaptés par le studio 
SELECT  m.Titre, m.Date_de_publication
FROM Manga m
LEFT JOIN Anime a ON  a.ID_manga = m.ID_manga
WHERE a.ID_anime  IS NULL;

-- 3.3 Chaînage des épisodes : chaque épisode avec son épisode précédent
SELECT e.numero_episode,e.titre_episode , p.titre_episode AS episode_precedent
FROM Episode e
LEFT JOIN Episode p ON  p.ID_episode = e.ID_episode_precedent
ORDER BY e.ID_saison, e.numero_episode;

-- 3.4 Qui diffuse quoi : production, diffuseur, type et période des droits
SELECT a.titre_anime, d.nom_diffuseur, d.type_diffuseur,d.date_debut_droit, d.date_fin_diffusion
FROM Anime a
JOIN Diffuser df ON df.ID_anime = a.ID_anime
JOIN Diffuseur d ON d.ID_diffuseur = df.ID_diffuseur
ORDER BY a.titre_anime, d.nom_diffuseur;

-- 3.5 Prestataires et productions sous-traitées, en conservant les prestataires jamais sollicités 
SELECT pr.nom_prestataire, pr.specialite, a.titre_anime
FROM Prestataire pr
LEFT JOIN Sous_traiter st ON st.ID_entreprise = pr.ID_entreprise
LEFT JOIN Anime a ON a.ID_anime = st.ID_anime
ORDER BY pr.nom_prestataire;

-- 3.6 Détail du travail réalisé : employé, rôle spécifique, épisode, saison, production et heures
SELECT e.nom_employe, e.prenom_employe, pt.role_specifique, a.titre_anime, s.num_saison, ep.numero_episode, ep.titre_episode, pt.nb_heure
FROM Participer_tache pt
JOIN Employe e  ON e.ID_employe = pt.ID_employe
JOIN Episode ep ON ep.ID_episode = pt.ID_episode
JOIN Saison s ON s.ID_saison= ep.ID_saison
JOIN Anime a ON a.ID_anime= pt.ID_anime
ORDER BY a.titre_anime, s.num_saison, ep.numero_episode;


-- SECTION 4 : REQUÊTES IMBRIQUÉES
-- 4.1 Mangas non encore adaptés 
SELECT Titre
FROM Manga 
WHERE ID_manga NOT IN (SELECT ID_manga
FROM Anime 
WHERE ID_manga IS NOT NULL);

-- 4.2 Productions n'ayant aucune saison enregistrée
SELECT a.titre_anime
FROM Anime a
WHERE NOT EXISTS (SELECT 1
FROM Saison s
WHERE s.ID_anime = a.ID_anime);

-- 4.3 Productions diffusées par au moins un diffuseur de type Streaming 
SELECT titre_anime
FROM Anime
WHERE ID_anime IN  (SELECT df.ID_anime
FROM Diffuser df
JOIN Diffuseur d ON d.ID_diffuseur = df.ID_diffuseur
WHERE d.type_diffuseur = 'Streaming');

-- 4.4 Employés ayant participé à au moins un épisode 
SELECT e.nom_employe, e.prenom_employe, e.role_employe
FROM Employe e
WHERE EXISTS (SELECT 1
FROM Participer_tache pt
WHERE pt.ID_employe = e.ID_employe);

-- 4.5 Séries TV dont le budget dépasse celui d'AU MOINS UN film 
SELECT titre_anime, budget
FROM Anime
WHERE format = 'TV'
AND budget > ANY (SELECT budget
FROM Anime
WHERE format = 'Film'
AND budget IS NOT NULL);

-- 4.6 Production au budget le plus élevé : budget supérieur ou égal à TOUS les autres
SELECT titre_anime, budget
FROM Anime
WHERE budget >= ALL (SELECT budget
FROM Anime
WHERE budget IS NOT NULL);

-- 4.7 Dépenses supérieures à la dépense moyenne
SELECT ID_depense,ID_anime,  categorie_depense,montant
FROM Depense 
WHERE montant > (SELECT AVG(montant) FROM Depense)
ORDER BY montant DESC;

-- 4.8 Productions dont les dépenses réelles dépassent le budget prévisionnel
SELECT a.titre_anime, a.budget
FROM Anime a
WHERE a.budget  IS NOT NULL
AND a.budget  < (SELECT SUM(d.montant)
FROM Depense d  
WHERE d.ID_anime = a.ID_anime);

-- 4.9 Prestataires jamais sollicités pour une production (NOT IN)
SELECT nom_prestataire, specialite
FROM Prestataire
WHERE ID_entreprise NOT IN (SELECT ID_entreprise FROM Sous_traiter);

-- REQUÊTE ANALYSÉE DANS LE README (plans d'exécution, algèbre relationnelle)
SELECT DISTINCT e.nom_employe, e.prenom_employe, a.titre_anime
FROM Employe e
JOIN Participer_tache p ON p.ID_employe = e.ID_employe
JOIN Anime a ON a.ID_anime= p.ID_anime
WHERE e.role_employe = 'Compositeur'
AND a.etat = 'Terminé';
