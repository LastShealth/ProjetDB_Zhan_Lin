CREATE DATABASE IF NOT EXISTS kogetsu_animation;
USE kogetsu_animation;
CREATE TABLE Auteur (
    ID_auteur INT PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL
);

CREATE TABLE Editeur (
    ID_editeur INT PRIMARY KEY,
    nom_editeur VARCHAR(100) NOT NULL
);

CREATE TABLE Realisateur (
    ID_Realisateur INT PRIMARY KEY,
    Nom_Realisateur VARCHAR(100) NOT NULL
);

CREATE TABLE Genre (
    ID_genre INT PRIMARY KEY,
    genre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Manga (
    ID_manga INT PRIMARY KEY,
    Titre VARCHAR(150) NOT NULL,
    Nombre_de_Tomes INT,
    Date_de_publication DATE,
    ID_auteur INT,
    ID_editeur INT,
    CONSTRAINT ID_manga_auteur FOREIGN KEY (ID_auteur) REFERENCES Auteur(ID_auteur) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT ID_manga_editeur FOREIGN KEY (ID_editeur) REFERENCES Editeur(ID_editeur) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Anime (
    ID_anime INT PRIMARY KEY,
    titre_anime VARCHAR(150) NOT NULL,
    format VARCHAR(50) NOT NULL,
    date_debut_prod DATE,
    budget DECIMAL(12,2),
    etat VARCHAR(50) NOT NULL,
    ID_manga INT,
    ID_Realisateur INT NOT NULL,
    CONSTRAINT ID_anime_manga FOREIGN KEY (ID_manga) REFERENCES Manga(ID_manga) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT ID_anime_realisateur FOREIGN KEY (ID_Realisateur) REFERENCES Realisateur(ID_Realisateur) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Employe (
    ID_employe INT PRIMARY KEY,
    nom_employe VARCHAR(100) NOT NULL,
    prenom_employe VARCHAR(100) NOT NULL,
    date_embauche DATE,
    role_employe VARCHAR(50) NOT NULL,
    ID_anime INT,
    CONSTRAINT ID_employe_anime FOREIGN KEY (ID_anime) REFERENCES Anime(ID_anime) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Prestataire (
    ID_entreprise INT PRIMARY KEY,
    specialite VARCHAR(100) NOT NULL,
    nom_prestataire VARCHAR(100) NOT NULL
);

CREATE TABLE Diffuseur (
    ID_diffuseur INT PRIMARY KEY,
    nom_diffuseur VARCHAR(100) NOT NULL,
    type_diffuseur VARCHAR(50) NOT NULL,
    date_debut_droit DATE,
    date_fin_diffusion DATE,
    montant_contrat DECIMAL(12,2) NOT NULL,
    CONSTRAINT ID_dates_diffuseur CHECK (date_fin_diffusion IS NULL OR date_debut_droit IS NULL OR date_fin_diffusion >= date_debut_droit)
);

CREATE TABLE Saison (
    ID_saison INT PRIMARY KEY,
    num_saison INT NOT NULL,
    date_sortie_saison DATE,
    ID_anime INT NOT NULL,
    CONSTRAINT ID_saison_anime FOREIGN KEY (ID_anime) REFERENCES Anime(ID_anime) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT ID_saison_anime_num UNIQUE (ID_anime, num_saison)
);

CREATE TABLE Episode (
    ID_episode INT PRIMARY KEY,
    numero_episode INT NOT NULL,
    titre_episode VARCHAR(150) NOT NULL,
    duree INT,
    date_episode DATE,
    ID_saison INT NOT NULL,
    ID_episode_precedent INT,
    CONSTRAINT ID_episode_saison FOREIGN KEY (ID_saison) REFERENCES Saison(ID_saison) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT ID_episode_precedent FOREIGN KEY (ID_episode_precedent) REFERENCES Episode(ID_episode) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT ID_episode_saison_num UNIQUE (ID_saison, numero_episode)

);

CREATE TABLE Depense (
    ID_depense INT PRIMARY KEY,
    date_depense_production DATE,
    montant DECIMAL(12,2) NOT NULL,
    categorie_depense VARCHAR(100) NOT NULL,
    motif VARCHAR(255),
    ID_anime INT NOT NULL,
    CONSTRAINT ID_depense_anime FOREIGN KEY (ID_anime) REFERENCES Anime(ID_anime) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Manga_Genre (
    ID_manga INT NOT NULL,
    ID_genre INT NOT NULL,
    PRIMARY KEY (ID_manga, ID_genre),
    CONSTRAINT ID_mg_manga FOREIGN KEY (ID_manga) REFERENCES Manga(ID_manga) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT ID_mg_genre FOREIGN KEY (ID_genre) REFERENCES Genre(ID_genre) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Anime_Genre (
    ID_anime INT NOT NULL,
    ID_genre INT NOT NULL,
    PRIMARY KEY (ID_anime, ID_genre),
    CONSTRAINT ID_ag_anime FOREIGN KEY (ID_anime) REFERENCES Anime(ID_anime) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT ID_ag_genre FOREIGN KEY (ID_genre) REFERENCES Genre(ID_genre) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Participer_tache (
    ID_employe INT NOT NULL,
    ID_episode INT NOT NULL,
    ID_anime INT NOT NULL,
    role_specifique VARCHAR(100) NOT NULL,
    nb_heure DECIMAL(6,2),
    PRIMARY KEY (ID_employe, ID_episode, ID_anime),
    CONSTRAINT ID_pt_employe FOREIGN KEY (ID_employe) REFERENCES Employe(ID_employe) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT ID_pt_episode FOREIGN KEY (ID_episode) REFERENCES Episode(ID_episode) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT ID_pt_anime FOREIGN KEY (ID_anime) REFERENCES Anime(ID_anime) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Sous_traiter (
    ID_entreprise INT NOT NULL,
    ID_anime INT NOT NULL,
    PRIMARY KEY (ID_entreprise, ID_anime),
    CONSTRAINT ID_st_entreprise FOREIGN KEY (ID_entreprise) REFERENCES Prestataire(ID_entreprise) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT ID_st_anime FOREIGN KEY (ID_anime) REFERENCES Anime(ID_anime) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Diffuser (
    ID_anime INT NOT NULL,
    ID_diffuseur INT NOT NULL,
    PRIMARY KEY (ID_anime, ID_diffuseur),
    CONSTRAINT ID_diff_anime FOREIGN KEY (ID_anime) REFERENCES Anime(ID_anime) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT ID_diff_diffuseur FOREIGN KEY (ID_diffuseur) REFERENCES Diffuseur(ID_diffuseur) ON DELETE CASCADE ON UPDATE CASCADE
);