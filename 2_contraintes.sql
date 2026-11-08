-- nombre de tomes > 0
ALTER TABLE Manga
    ADD CONSTRAINT ID_manga_tomes_positif
    CHECK (Nombre_de_Tomes IS NULL OR Nombre_de_Tomes > 0);

-- date qui existe et non dans le futur
ALTER TABLE Manga
    ADD CONSTRAINT ID_manga_date_plage
    CHECK (Date_de_publication IS NULL OR Date_de_publication BETWEEN '1867-01-01' and '2026-11-08');


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
    CHECK (date_debut_prod IS NULL OR date_debut_prod BETWEEN '1950-01-01' and '2026-11-08');



-- role check
ALTER TABLE Employe
    ADD CONSTRAINT ID_employe_role_liste
    CHECK (role_employe IN ('Réalisateur', 'Scénariste', 'Animateur', 'Character Designer',
                            'Directeur Artistique', 'Ingénieur du son', 'Producteur',
                            'Monteur', 'Compositeur', 'Doubleur'));

-- date qui existe et non dans le futur
ALTER TABLE Employe
    ADD CONSTRAINT ID_employe_date_embauche_plage
    CHECK (date_embauche IS NULL OR date_embauche BETWEEN '1950-01-01' AND '2026-11-08');


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
    CHECK (date_debut_droit IS NULL OR date_debut_droit BETWEEN '1950-01-01' AND '2026-11-08');



-- num_saison > 0
ALTER TABLE Saison
    ADD CONSTRAINT ID_saison_num_positif
    CHECK (num_saison > 0);

-- date qui existe et non dans le futur
ALTER TABLE Saison
    ADD CONSTRAINT ID_saison_date_plage
    CHECK (date_sortie_saison IS NULL OR date_sortie_saison BETWEEN '1950-01-01' AND '2026-11-08');



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
    CHECK (date_episode IS NULL OR date_episode BETWEEN '1950-01-01' AND '2026-11-08');



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
    CHECK (date_depense_production IS NULL OR date_depense_production BETWEEN '1950-01-01' AND '2026-11-08');



-- nb_heure > 0
ALTER TABLE Participer_tache
    ADD CONSTRAINT ID_pt_nb_heure_positif
    CHECK (nb_heure IS NULL OR nb_heure >= 0);
