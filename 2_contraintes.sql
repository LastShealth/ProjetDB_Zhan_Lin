-- ============================================================
-- Fichier : 2_contraintes.sql
-- Description : Contraintes de validation / règles métiers
-- À exécuter APRÈS 1_tables.sql (création des tables)
-- ============================================================

-- juste des lettres, espaces et tirets
ALTER TABLE Genre
    ADD CONSTRAINT ID_genre_format
    CHECK (genre REGEXP '^[A-Za-zÀ-ÿ -]{1,67}$');

-- rôle non vide
ALTER TABLE Participer_tache
    ADD CONSTRAINT ID_pt_role_non_vide
    CHECK (TRIM(role_specifique) <> '');

-- nom non vide
ALTER TABLE Auteur
    ADD CONSTRAINT ID_auteur_nom_non_vide
    CHECK (TRIM(Nom) <> '');

-- nom non vide
ALTER TABLE Editeur
    ADD CONSTRAINT ID_editeur_nom_non_vide
    CHECK (TRIM(nom_editeur) <> '');

-- nom non vide
ALTER TABLE Realisateur
    ADD CONSTRAINT ID_realisateur_nom_non_vide
    CHECK (TRIM(Nom_Realisateur) <> '');

-- nom non vide
ALTER TABLE Employe
    ADD CONSTRAINT ID_employe_noms_non_vides
    CHECK (TRIM(nom_employe) <> '' AND TRIM(prenom_employe) <> '');

-- nom non vide
ALTER TABLE Prestataire
    ADD CONSTRAINT ID_prestataire_nom_non_vide
    CHECK (TRIM(nom_prestataire) <> '');

-- nom non vide
ALTER TABLE Diffuseur
    ADD CONSTRAINT ID_diffuseur_nom_non_vide
    CHECK (TRIM(nom_diffuseur) <> '');

-- titre non vide
ALTER TABLE Anime
    ADD CONSTRAINT ID_anime_titre_non_vide
    CHECK (TRIM(titre_anime) <> '');

-- titre non vide
ALTER TABLE Episode
    ADD CONSTRAINT ID_episode_titre_non_vide
    CHECK (TRIM(titre_episode) <> '');    

-- titre non vide
ALTER TABLE Manga
    ADD CONSTRAINT ID_manga_titre_non_vide
    CHECK (TRIM(Titre) <> '');



-- nombre de tomes > 0
ALTER TABLE Manga
    ADD CONSTRAINT ID_manga_tomes_positif
    CHECK (Nombre_de_Tomes IS NULL OR Nombre_de_Tomes > 0);

-- date qui existe et non dans le futur
ALTER TABLE Manga
    ADD CONSTRAINT ID_manga_date_plage
    CHECK (Date_de_publication IS NULL OR Date_de_publication BETWEEN '1867-01-01' AND CURRENT_DATE);



-- format check
ALTER TABLE Anime
    ADD CONSTRAINT ID_anime_format_liste
    CHECK (format IN ('TV', 'Film', 'OVA', 'OAV', 'ONA', 'Spécial', 'Web'));

-- etat check
ALTER TABLE Anime
    ADD CONSTRAINT ID_anime_etat_liste
    CHECK (etat IN ('En production', 'Terminé', 'En pause', 'Annulé', 'Planifié'));

-- budget > 0
ALTER TABLE Anime
    ADD CONSTRAINT ID_anime_budget_positif
    CHECK (budget IS NULL OR budget >= 0);

-- date qui existe et non dans le futur
ALTER TABLE Anime
    ADD CONSTRAINT ID_anime_date_prod_plage
    CHECK (date_debut_prod IS NULL OR date_debut_prod BETWEEN '1950-01-01' AND CURRENT_DATE);



-- role check
ALTER TABLE Employe
    ADD CONSTRAINT ID_employe_role_liste
    CHECK (role_employe IN ('Réalisateur', 'Scénariste', 'Animateur', 'Character Designer',
                            'Directeur Artistique', 'Ingénieur du son', 'Producteur',
                            'Monteur', 'Compositeur', 'Doubleur'));

-- date qui existe et non dans le futur
ALTER TABLE Employe
    ADD CONSTRAINT ID_employe_date_embauche_plage
    CHECK (date_embauche IS NULL OR date_embauche BETWEEN '1950-01-01' AND CURRENT_DATE);


-- specialité check
ALTER TABLE Prestataire
    ADD CONSTRAINT ID_prestataire_specialite_liste
    CHECK (specialite IN ('Animation', 'Doublage', 'Musique', 'Sound Design',
                          'Effets spéciaux', 'Sous-titrage', 'Marketing',
                          'Post-production', 'Graphisme'));



-- type_diffuseur check
ALTER TABLE Diffuseur
    ADD CONSTRAINT ID_diffuseur_type_liste
    CHECK (type_diffuseur IN ('TV', 'Streaming', 'Cinéma', 'Web', 'Câble', 'Satellite'));

-- montant >= 0
ALTER TABLE Diffuseur
    ADD CONSTRAINT ID_diffuseur_montant_positif
    CHECK (montant_contrat >= 0);

-- date qui fait sense
ALTER TABLE Diffuseur
    ADD CONSTRAINT ID_diffuseur_dates_coherence
    CHECK (date_fin_diffusion IS NULL OR date_debut_droit IS NULL
           OR date_fin_diffusion >= date_debut_droit);

-- date qui existe et  non dans le futur
ALTER TABLE Diffuseur
    ADD CONSTRAINT ID_diffuseur_date_debut_plage
    CHECK (date_debut_droit IS NULL OR date_debut_droit BETWEEN '1950-01-01' AND CURRENT_DATE);



-- num_saison > 0
ALTER TABLE Saison
    ADD CONSTRAINT ID_saison_num_positif
    CHECK (num_saison > 0);

-- date qui existe et non dans le futur
ALTER TABLE Saison
    ADD CONSTRAINT ID_saison_date_plage
    CHECK (date_sortie_saison IS NULL OR date_sortie_saison BETWEEN '1950-01-01' AND CURRENT_DATE);



-- numero_episode > 0
ALTER TABLE Episode
    ADD CONSTRAINT ID_episode_num_positif
    CHECK (numero_episode > 0);

-- duree > 0
ALTER TABLE Episode
    ADD CONSTRAINT ID_episode_duree_positive
    CHECK (duree IS NULL OR duree > 0);

-- date qui existe et non dans le futur     
ALTER TABLE Episode
    ADD CONSTRAINT ID_episode_date_plage
    CHECK (date_episode IS NULL OR date_episode BETWEEN '1950-01-01' AND CURRENT_DATE);

-- ID_episode_precedent_pas_self ne peut pas s'auto refere, car un episode ne peut pas être son propre épisode précédent
ALTER TABLE Episode
    ADD CONSTRAINT ID_episode_precedent_pas_self
    CHECK (ID_episode_precedent IS NULL OR ID_episode_precedent <> ID_episode);



-- montant >= 0
ALTER TABLE Depense
    ADD CONSTRAINT ID_depense_montant_positif
    CHECK (montant >= 0);

-- categorie check
ALTER TABLE Depense
    ADD CONSTRAINT ID_depense_categorie_liste
    CHECK (categorie_depense IN ('Animation', 'Doublage', 'Musique', 'Marketing',
                                 'Licence', 'Matériel', 'Salaires', 'Post-production',
                                 'Déplacement', 'Autre'));

-- date qui existe et non dans le futur
ALTER TABLE Depense
    ADD CONSTRAINT ID_depense_date_plage
    CHECK (date_depense_production IS NULL OR date_depense_production BETWEEN '1950-01-01' AND CURRENT_DATE);



-- nb_heure > 0
ALTER TABLE Participer_tache
    ADD CONSTRAINT ID_pt_nb_heure_positif
    CHECK (nb_heure IS NULL OR nb_heure >= 0);