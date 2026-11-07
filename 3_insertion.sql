-- ============================================================
-- 1. NOUVEAUX AUTEURS & ÉDITEURS
-- ============================================================

INSERT INTO Auteur (ID_auteur, Nom) VALUES
(6, 'Mamare Touno'),         -- Log Horizon
(7, 'Kenjiro Hata'),         -- Tonikaku Kawaii
(8, 'Tsugumi Ohba'),          -- Death Note
(9, 'Shinichiro Watanabe'),   -- Cowboy Bebop (Auteur/Réalisateur)
(10, 'Hajime Isayama'),      -- L'Attaque des Titans
(11, 'Haruichi Furudate'),    -- Haikyu!!
(12, 'Yoshiyuki Tomino'),     -- Mobile Suit Gundam
(13, 'Kanehito Yamada');      -- Frieren

INSERT INTO Editeur (ID_editeur, nom_editeur) VALUES
(5, 'Enterbrain'),
(6, 'Shogakukan (Weekly Shonen Sunday)'),
(7, 'Kodansha'),
(8, 'Sunrise Studios');

INSERT INTO Realisateur (ID_Realisateur, Nom_Realisateur) VALUES
(5, 'Shinji Ishihira'),      -- Log Horizon
(6, 'Hiroshi Ikehata'),      -- Tonikaku Kawaii
(7, 'Tetsuro Araki'),        -- Death Note / SnK S1
(8, 'Shinichiro Watanabe'),  -- Cowboy Bebop
(9, 'Susumu Mitsunaka'),     -- Haikyu!!
(10, 'Yoshiyuki Tomino'),    -- Gundam
(11, 'Keiichiro Saito');     -- Frieren

-- ============================================================
-- 2. NOUVEAUX GENRES
-- ============================================================

INSERT INTO Genre (ID_genre, genre) VALUES
(7, 'Romance'),
(8, 'Comédie'),
(9, 'Isekai'),
(10, 'Sci-Fi'),
(11, 'Mystère'),
(12, 'Psychologique'),
(13, 'Mecha'),
(14, 'Tranche de vie'),
(15, 'Sports');

-- ============================================================
-- 3. NOUVEAUX MANGAS / NOVELS
-- ============================================================

INSERT INTO Manga (ID_manga, Titre, Nombre_de_Tomes, Date_de_publication, ID_auteur, ID_editeur) VALUES
(6, 'Log Horizon', 11, '2010-04-13', 6, 5),
(7, 'Tonikaku Kawaii: Fly Me to the Moon', 27, '2018-02-14', 7, 6),
(8, 'Death Note', 12, '2003-12-01', 8, 2),
(9, 'Cowboy Bebop (Manga Adapt)', 3, '1998-04-01', 9, 4),
(10, 'L''Attaque des Titans', 34, '2009-09-09', 10, 7),
(11, 'Haikyu!!', 45, '2012-02-20', 11, 2),
(12, 'Mobile Suit Gundam', 2, '1979-04-07', 12, 8),
(13, 'Frieren: Beyond Journey''s End', 13, '2020-04-28', 13, 6);

INSERT INTO Manga_Genre (ID_manga, ID_genre) VALUES
(6, 9), (6, 2), (6, 1),      -- Log Horizon: Isekai, Fantasy, Aventure
(7, 7), (7, 8), (7, 14),     -- Tonikaku Kawaii: Romance, Comédie, Tranche de vie
(8, 11), (8, 12), (8, 4),    -- Death Note: Mystère, Psychologique, Surnaturel
(9, 10), (9, 1), (9, 3),     -- Cowboy Bebop: Sci-Fi, Aventure, Action
(10, 3), (10, 5), (10, 11),  -- Attack on Titan: Action, Drame, Mystère
(11, 15), (11, 8), (11, 14), -- Haikyu!!: Sports, Comédie, Tranche de vie
(12, 13), (12, 10), (12, 3), -- Gundam: Mecha, Sci-Fi, Action
(13, 2), (13, 1), (13, 14);  -- Frieren: Fantasy, Aventure, Tranche de vie

-- ============================================================
-- 4. NOUVEAUX ANIMÉS
-- ============================================================

INSERT INTO Anime (ID_anime, titre_anime, format, date_debut_prod, budget, etat, ID_manga, ID_Realisateur) VALUES
(6, 'Log Horizon S1', 'TV', '2013-01-10', 3000000.00, 'Terminé', 6, 5),
(7, 'Tonikaku Kawaii', 'TV', '2020-03-01', 5000000.00, 'Terminé', 7, 6), -- Englobe S1 & S2
(8, 'Death Note', 'TV', '2006-02-01', 5000000.00, 'Terminé', 8, 7),
(9, 'Cowboy Bebop', 'TV', '1997-06-01', 7000000.00, 'Terminé', 9, 8),
(10, 'L''Attaque des Titans S1', 'TV', '2012-08-01', 8500000.00, 'Terminé', 10, 7),
(11, 'Haikyu!! S1', 'TV', '2013-11-01', 4000000.00, 'Terminé', 11, 9),
(12, 'Mobile Suit Gundam', 'TV', '1978-09-01', 2000000.00, 'Terminé', 12, 10),
(13, 'Frieren: Beyond Journey''s End', 'TV', '2023-01-15', 6000000.00, 'Terminé', 13, 11);

INSERT INTO Anime_Genre (ID_anime, ID_genre) VALUES
(6, 9), (6, 2),
(7, 7), (7, 8), (7, 14),
(8, 11), (8, 12),
(9, 10), (9, 3),
(10, 3), (10, 5), (10, 11),
(11, 15), (11, 8),
(12, 13), (12, 10),
(13, 2), (13, 1), (13, 14);

-- ============================================================
-- 5. ÉQUIPE & SAISONS
-- ============================================================

INSERT INTO Employe (ID_employe, nom_employe, prenom_employe, date_embauche, role_employe, ID_anime) VALUES
(7, 'Kuroda', 'Yosuke', '2013-02-01', 'Scénariste', 6),
(8, 'Sasaki', 'Masaaki', '2020-04-01', 'Character Designer', 7),
(9, 'Takeuchi', 'Kazuyoshi', '2006-03-15', 'Monteur', 8),
(10, 'Kanno', 'Yoko', '1997-07-01', 'Compositeur', 9),
(11, 'Sawano', 'Hiroyuki', '2012-09-01', 'Compositeur', 10),
(12, 'Evan', 'Call', '2023-02-01', 'Compositeur', 13);

INSERT INTO Saison (ID_saison, num_saison, date_sortie_saison, ID_anime) VALUES
(6, 1, '2013-10-05', 6),
(7, 1, '2020-10-03', 7),
(8, 1, '2006-10-04', 8),
(9, 1, '1998-04-03', 9),
(10, 1, '2013-04-07', 10),
(11, 1, '2014-04-06', 11),
(12, 1, '1979-04-07', 12),
(13, 2, '2023-04-08', 7),  -- Tonikaku Kawaii Saison 2
(14, 1, '2023-09-29', 13); -- Frieren Saison 1

-- ============================================================
-- 6. ÉPISODES (CHAÎNAGE RÉFLEXIF EXHAUSTIF)
-- ============================================================

INSERT INTO Episode (ID_episode, numero_episode, titre_episode, duree, date_episode, ID_saison, ID_episode_precedent) VALUES
-- ------------------------------------------------------------
-- Log Horizon S1 (Saison ID: 6) - 25 Épisodes
-- ------------------------------------------------------------
(9,   1, 'L''Apocalypse', 24, '2013-10-05', 6, NULL),
(10,  2, 'La Bataille de Lunas', 24, '2013-10-12', 6, 9),
(18,  3, 'La Profondeur de la Palme', 24, '2013-10-19', 6, 10),
(19,  4, 'Évasion', 24, '2013-10-26', 6, 18),
(20,  5, 'Retour à Akiba', 24, '2013-11-02', 6, 19),
(21,  6, 'Les Environs de la ville', 24, '2013-11-09', 6, 20),
(22,  7, 'Un crescent de lune', 24, '2013-11-16', 6, 21),
(23,  8, 'Le Spécialiste des batailles', 24, '2013-11-23', 6, 22),
(24,  9, 'La Table ronde de la ville', 24, '2013-11-30', 6, 23),
(25, 10, 'Obtenir le pouvoir', 24, '2013-12-07', 6, 24),
(26, 11, 'L''Alliance de la Table Ronde', 24, '2013-12-14', 6, 25),
(27, 12, 'Le Palais de la Danse', 24, '2013-12-21', 6, 26),
(28, 13, 'Le Protecteur de la Terre', 24, '2013-12-28', 6, 27),
(29, 14, 'Le Mur de la Cité', 24, '2014-01-04', 6, 28),
(30, 15, 'L''Attaque des Gobelins', 24, '2014-01-11', 6, 29),
(31, 16, 'Le Choc des armées', 24, '2014-01-18', 6, 30),
(32, 17, 'Le Héritier du Trône', 24, '2014-01-25', 6, 31),
(33, 18, 'La Promesse du chevalier', 24, '2014-02-01', 6, 32),
(34, 19, 'À la poursuite du passé', 24, '2014-02-08', 6, 33),
(35, 20, 'Contrat social', 24, '2014-02-15', 6, 34),
(36, 21, 'Valse de la nuit', 24, '2014-02-22', 6, 35),
(37, 22, 'Le Roi des gobelins', 24, '2014-03-01', 6, 36),
(38, 23, 'L''Appel des profondeurs', 24, '2014-03-08', 6, 37),
(39, 24, 'La Légende de la Table Ronde', 24, '2014-03-15', 6, 38),
(40, 25, 'La Balance de la Vérité', 24, '2014-03-22', 6, 39),

-- ------------------------------------------------------------
-- Tonikaku Kawaii S1 (Saison ID: 7) - 12 Épisodes
-- ------------------------------------------------------------
(11,  1, 'Mariage', 24, '2020-10-03', 7, NULL),
(41,  2, 'La Première Nuit', 24, '2020-10-10', 7, 11),
(42,  3, 'Les Sœurs', 24, '2020-10-17', 7, 41),
(43,  4, 'Promenade nocturne', 24, '2020-10-24', 7, 42),
(44,  5, 'Règles du mariage', 24, '2020-10-31', 7, 43),
(45,  6, 'Bagues de fiançailles', 24, '2020-11-07', 7, 44),
(46,  7, 'Voyage à Nara', 24, '2020-11-14', 7, 45),
(47,  8, 'Rencontre avec les parents', 24, '2020-11-21', 7, 46),
(48,  9, 'Sous la pluie', 24, '2020-11-28', 7, 47),
(49, 10, 'La Maison brûlée', 24, '2020-12-05', 7, 48),
(50, 11, 'Nouvelle vie', 24, '2020-12-12', 7, 49),
(51, 12, 'Pour toujours ensemble', 24, '2020-12-19', 7, 50),

-- ------------------------------------------------------------
-- Death Note (Saison ID: 8) - 37 Épisodes
-- ------------------------------------------------------------
(12,  1, 'Renaissance', 23, '2006-10-04', 8, NULL),
(13,  2, 'Confrontation', 23, '2006-10-11', 8, 12),
(52,  3, 'Pacte', 23, '2006-10-18', 8, 13),
(53,  4, 'Poursuite', 23, '2006-10-25', 8, 52),
(54,  5, 'Tactique', 23, '2006-11-01', 8, 53),
(55,  6, 'Déchirement', 23, '2006-11-08', 8, 54),
(56,  7, 'Temps couvert', 23, '2006-11-15', 8, 55),
(57,  8, 'Regard', 23, '2006-11-22', 8, 56),
(58,  9, 'Contact', 23, '2006-11-29', 8, 57),
(59, 10, 'Doute', 23, '2006-12-06', 8, 58),
(60, 11, 'Assaut', 23, '2006-12-13', 8, 59),
(61, 12, 'Amour', 23, '2006-12-20', 8, 60),
(62, 13, 'Confession', 23, '2006-12-27', 8, 61),
(63, 14, 'Ami', 23, '2007-01-10', 8, 62),
(64, 15, 'Pari', 23, '2007-01-17', 8, 63),
(65, 16, 'Décision', 23, '2007-01-24', 8, 64),
(66, 17, 'Exécution', 23, '2007-01-31', 8, 65),
(67, 18, 'Alliés', 23, '2007-02-07', 8, 66),
(68, 19, 'Matsuda', 23, '2007-02-14', 8, 67),
(69, 20, 'Imposture', 23, '2007-02-21', 8, 68),
(70, 21, 'Performance', 23, '2007-02-28', 8, 69),
(71, 22, 'Conduite', 23, '2007-03-07', 8, 70),
(72, 23, 'Frenzy', 23, '2007-03-14', 8, 71),
(73, 24, 'Restauration', 23, '2007-03-21', 8, 72),
(74, 25, 'Silence', 23, '2007-03-28', 8, 73),
(75, 26, 'Ressentiment', 23, '2007-04-04', 8, 74),
(76, 27, 'Enlèvement', 23, '2007-04-11', 8, 75),
(77, 28, 'Impatience', 23, '2007-04-18', 8, 76),
(78, 29, 'Père', 23, '2007-04-25', 8, 77),
(79, 30, 'Justice', 23, '2007-05-02', 8, 78),
(80, 31, 'Transfert', 23, '2007-05-09', 8, 79),
(81, 32, 'Choix', 23, '2007-05-16', 8, 80),
(82, 33, 'Mépris', 23, '2007-05-23', 8, 81),
(83, 34, 'Vigilance', 23, '2007-05-30', 8, 82),
(84, 35, 'Malice', 23, '2007-06-06', 8, 83),
(85, 36, '1.28', 23, '2007-06-13', 8, 84),
(86, 37, 'Nouveau Monde', 23, '2007-06-20', 8, 85),

-- ------------------------------------------------------------
-- Cowboy Bebop (Saison ID: 9) - 26 Épisodes
-- ------------------------------------------------------------
(14,  1, 'Asteroid Blues', 24, '1998-04-03', 9, NULL),
(87,  2, 'Stray Dog Strut', 24, '1998-04-10', 9, 14),
(88,  3, 'Honky Tonk Women', 24, '1998-04-17', 9, 87),
(89,  4, 'Gateway Shuffle', 24, '1998-04-24', 9, 88),
(90,  5, 'Ballad of Fallen Angels', 24, '1998-05-01', 9, 89),
(91,  6, 'Sympathy for the Devil', 24, '1998-05-08', 9, 90),
(92,  7, 'Heavy Metal Queen', 24, '1998-05-15', 9, 91),
(93,  8, 'Waltz for Venus', 24, '1998-05-22', 9, 92),
(94,  9, 'Jamming With Edward', 24, '1998-05-29', 9, 93),
(95, 10, 'Ganymede Elegy', 24, '1998-06-05', 9, 94),
(96, 11, 'Toys in the Attic', 24, '1998-06-12', 9, 95),
(97, 12, 'Jupiter Jazz (Part 1)', 24, '1998-06-19', 9, 96),
(98, 13, 'Jupiter Jazz (Part 2)', 24, '1998-06-26', 9, 97),
(99, 14, 'Bohemian Rhapsody', 24, '1998-07-03', 9, 98),
(100,15, 'My Funny Valentine', 24, '1998-07-10', 9, 99),
(101,16, 'Black Dog Serenade', 24, '1998-07-17', 9, 100),
(102,17, 'Mushroom Samba', 24, '1998-07-24', 9, 101),
(103,18, 'Speak Like a Child', 24, '1998-07-31', 9, 102),
(104,19, 'Wild Horses', 24, '1998-08-07', 9, 103),
(105,20, 'Pierrot Le Fou', 24, '1998-08-14', 9, 104),
(106,21, 'Boogie Woogie Feng Shui', 24, '1998-08-21', 9, 105),
(107,22, 'Cowboy Funk', 24, '1998-08-28', 9, 106),
(108,23, 'Brain Scratch', 24, '1998-09-04', 9, 107),
(109,24, 'Hard Luck Woman', 24, '1998-09-11', 9, 108),
(110,25, 'The Real Folk Blues (Part 1)', 24, '1998-09-18', 9, 109),
(111,26, 'The Real Folk Blues (Part 2)', 24, '1998-09-25', 9, 110),

-- ------------------------------------------------------------
-- L'Attaque des Titans S1 (Saison ID: 10) - 25 Épisodes
-- ------------------------------------------------------------
(15,  1, 'À toi qui vis 2000 ans plus tard', 24, '2013-04-07', 10, NULL),
(112, 2, 'Ce jour-là', 24, '2013-04-14', 10, 15),
(113, 3, 'Une lueur dans les ténèbres', 24, '2013-04-21', 10, 112),
(114, 4, 'La nuit de la cérémonie de remise des diplômes', 24, '2013-04-28', 10, 113),
(115, 5, 'Première bataille', 24, '2013-05-05', 10, 114),
(116, 6, 'Une petite lame', 24, '2013-05-12', 10, 115),
(117, 7, 'Un court éclat', 24, '2013-05-19', 10, 116),
(118, 8, 'On entend le battement de cœur', 24, '2013-05-26', 10, 117),
(119, 9, 'Où se trouve le bras gauche ?', 24, '2013-06-02', 10, 118),
(120, 10, 'Le Démon', 24, '2013-06-09', 10, 119),
(121, 11, 'Icône', 24, '2013-06-16', 10, 120),
(122, 12, 'Blessure', 24, '2013-06-23', 10, 121),
(123, 13, 'Désir primordial', 24, '2013-06-30', 10, 122),
(124, 14, 'On ne peut pas le regarder dans les yeux', 24, '2013-07-07', 10, 123),
(125, 15, 'Un escadron de cas d''école', 24, '2013-07-14', 10, 124),
(126, 16, 'Ce qu''il faut faire maintenant', 24, '2013-07-21', 10, 125),
(127, 17, 'Le Titan Féminin', 24, '2013-07-28', 10, 126),
(128, 18, 'La Forêt des arbres géants', 24, '2013-08-04', 10, 127),
(129, 19, 'Morsure', 24, '2013-08-11', 10, 128),
(130, 20, 'Erwin Smith', 24, '2013-08-18', 10, 129),
(131, 21, 'Coup d''assommoir', 24, '2013-08-25', 10, 130),
(132, 22, 'Les Vaincus', 24, '2013-09-01', 10, 131),
(133, 23, 'Sourire', 24, '2013-09-08', 10, 132),
(134, 24, 'Pitié', 24, '2013-09-15', 10, 133),
(135, 25, 'Mur', 24, '2013-09-22', 10, 134),

-- ------------------------------------------------------------
-- Haikyu!! S1 (Saison ID: 11) - 25 Épisodes
-- ------------------------------------------------------------
(16,  1, 'En deçà et au-delà', 24, '2014-04-06', 11, NULL),
(136, 2, 'Le club de volley de Karasuno', 24, '2014-04-13', 11, 16),
(137, 3, 'Le passeur idéal', 24, '2014-04-20', 11, 136),
(138, 4, 'La vue du sommet', 24, '2014-04-27', 11, 137),
(139, 5, 'La lâche panique', 24, '2014-05-04', 11, 138),
(140, 6, 'Une équipe formidable', 24, '2014-05-11', 11, 139),
(141, 7, 'Face au roi du terrain', 24, '2014-05-18', 11, 140),
(142, 8, 'Celui qu''on appelle l''As', 24, '2014-05-25', 11, 141),
(143, 9, 'La passe à l''As', 24, '2014-06-01', 11, 142),
(144, 10, 'Aspiration', 24, '2014-06-08', 11, 143),
(145, 11, 'La décision', 24, '2014-06-15', 11, 144),
(146, 12, 'Retrouvailles avec le chat sauvage', 24, '2014-06-22', 11, 145),
(147, 13, 'Rival', 24, '2014-06-29', 11, 146),
(148, 14, 'Des adversaires redoutables', 24, '2014-07-06', 11, 147),
(149, 15, 'Formidable', 24, '2014-07-13', 11, 148),
(150, 16, 'Gagnants et perdants', 24, '2014-07-20', 11, 149),
(151, 17, 'Le Mur de Fer de Date', 24, '2014-07-27', 11, 150),
(152, 18, 'Garder les arrières', 24, '2014-08-03', 11, 151),
(153, 19, 'Le Chef d''orchestre', 24, '2014-08-10', 11, 152),
(154, 20, 'Oikawa Toru n''est pas un génie', 24, '2014-08-17', 11, 153),
(155, 21, 'La vraie valeur du sénior', 24, '2014-08-24', 11, 154),
(156, 22, 'Évolution', 24, '2014-08-31', 11, 155),
(157, 23, 'Changer la donne', 24, '2014-09-07', 11, 156),
(158, 24, 'Le Roi Déchu', 24, '2014-09-14', 11, 157),
(159, 25, 'Le Troisième Jour', 24, '2014-09-21', 11, 158),

-- ------------------------------------------------------------
-- Mobile Suit Gundam (Saison ID: 12) - 43 Épisodes
-- ------------------------------------------------------------
(17,  1, 'Gundam se lève sur la terre', 25, '1979-04-07', 12, NULL),
(160, 2, 'Détruisez le Gundam', 25, '1979-04-14', 12, 17),
(161, 3, 'Attaque sur la citadelle', 25, '1979-04-21', 12, 160),
(162, 4, 'Fuite dans l''espace', 25, '1979-04-28', 12, 161),
(163, 5, 'Rentrée dans l''atmosphère', 25, '1979-05-05', 12, 162),
(164, 6, 'Le Piège de Garma', 25, '1979-05-12', 12, 163),
(165, 7, 'Évasion du noyau', 25, '1979-05-19', 12, 164),
(166, 8, 'Le Champ de bataille', 25, '1979-05-26', 12, 165),
(167, 9, 'Gundam s''envole', 25, '1979-06-02', 12, 166),
(168, 10, 'Le Destin de Garma', 25, '1979-06-09', 12, 167),
(169, 11, 'Récompense pour un amiral', 25, '1979-06-16', 12, 168),
(170, 12, 'La Vengeance de Ramba Ral', 25, '1979-06-23', 12, 169),
(171, 13, 'Les Retrouvailles de Sayla', 25, '1979-06-30', 12, 170),
(172, 14, 'Le Défi du temps', 25, '1979-07-07', 12, 171),
(173, 15, 'L''Île de Doan', 25, '1979-07-14', 12, 172),
(174, 16, 'L''Attaque de Sayla', 25, '1979-07-21', 12, 173),
(175, 17, 'Le Désert de la mort', 25, '1979-07-28', 12, 174),
(176, 18, 'La Charge de Ramba Ral', 25, '1979-08-04', 12, 175),
(177, 19, 'Combat corps à corps', 25, '1979-08-11', 12, 176),
(178, 20, 'La Fin de Ramba Ral', 25, '1979-08-18', 12, 177),
(179, 21, 'Haine accumulée', 25, '1979-08-25', 12, 178),
(180, 22, 'Le Piège de M''Quve', 25, '1979-09-01', 12, 179),
(181, 23, 'Secours pour la base', 25, '1979-09-08', 12, 180),
(182, 24, 'La Tri-Étoile Noire', 25, '1979-09-15', 12, 181),
(183, 25, 'La Bataille d''Odessa', 25, '1979-09-22', 12, 182),
(184, 26, 'Infiltration à Jaburo', 25, '1979-09-29', 12, 183),
(185, 27, 'Spy en embuscade', 25, '1979-10-06', 12, 184),
(186, 28, 'L''Atlantique sous la pluie', 25, '1979-10-13', 12, 185),
(187, 29, 'Chute de Jaburo', 25, '1979-10-20', 12, 186),
(188, 30, 'Les Petits Héros', 25, '1979-10-27', 12, 187),
(189, 31, 'Zanzibar en ligne de mire', 25, '1979-11-03', 12, 188),
(190, 32, 'Le Piège de Dren', 25, '1979-11-10', 12, 189),
(191, 33, 'Le Consulat de Side 6', 25, '1979-11-17', 12, 190),
(192, 34, 'Rencontre fortuite', 25, '1979-11-24', 12, 191),
(193, 35, 'La Citadelle de Solomon', 25, '1979-12-01', 12, 192),
(194, 36, 'La Charge du Big Zam', 25, '1979-12-08', 12, 193),
(195, 37, 'Le Duel au Texas', 25, '1979-12-15', 12, 194),
(196, 38, 'Le R-Jarja d''Elmeth', 25, '1979-12-22', 12, 195),
(197, 39, 'Challia Bull', 25, '1979-12-29', 12, 196),
(198, 40, 'Lallaa et Amuro', 25, '1980-01-05', 12, 197),
(199, 41, 'Espace cosmique', 25, '1980-01-12', 12, 198),
(200, 42, 'La Forteresse A Baoa Qu', 25, '1980-01-19', 12, 199),
(201, 43, 'Évasion finale', 25, '1980-01-26', 12, 200),

-- ------------------------------------------------------------
-- Tonikaku Kawaii S2 (Saison ID: 13) - 12 Épisodes
-- ------------------------------------------------------------
(202, 1, 'Parce que tous les deux', 24, '2023-04-08', 13, NULL),
(203, 2, 'Dans les bois', 24, '2023-04-15', 13, 202),
(204, 3, 'Avant que le printemps ne vienne', 24, '2023-04-22', 13, 203),
(205, 4, 'La Nuit sans fin', 24, '2023-04-29', 13, 204),
(206, 5, 'Les Jours de plage', 24, '2023-05-06', 13, 205),
(207, 6, 'Sous les feux d''artifice', 24, '2023-05-13', 13, 206),
(208, 7, 'Une histoire de cœur', 24, '2023-05-20', 13, 207),
(209, 8, 'Parmi les étoiles', 24, '2023-05-27', 13, 208),
(210, 9, 'Les Ombres du passé', 24, '2023-06-03', 13, 209),
(211, 10, 'Voyage de retour', 24, '2023-06-10', 13, 210),
(212, 11, 'Chaudes larmes', 24, '2023-06-17', 13, 211),
(213, 12, 'Le Monde que nous voyons', 24, '2023-06-24', 13, 212),

-- ------------------------------------------------------------
-- Frieren: Beyond Journey''s End (Saison ID: 14) - 28 Épisodes
-- ------------------------------------------------------------
(214,  1, 'La Fin du voyage', 24, '2023-09-29', 14, NULL),
(215,  2, 'Ce n''était pas forcément de la magie', 24, '2023-09-29', 14, 214),
(216,  3, 'La Magie pour tuer les démons', 24, '2023-09-29', 14, 215),
(217,  4, 'La Terre où dorment les âmes', 24, '2023-09-29', 14, 216),
(218,  5, 'Le Phantôme du passé', 24, '2023-10-06', 14, 217),
(219,  6, 'Le Héros du village', 24, '2023-10-13', 14, 218),
(220,  7, 'Comme une sorte de conte', 24, '2023-10-20', 14, 219),
(221,  8, 'Frieren la faucheuse', 24, '2023-10-27', 14, 220),
(222,  9, 'Aura l''Guillotine', 24, '2023-11-03', 14, 221),
(223, 10, 'Une puissante mage', 24, '2023-11-10', 14, 222),
(224, 11, 'Le Nord du continent', 24, '2023-11-17', 14, 223),
(225, 12, 'Une vraie bénédiction', 24, '2023-11-24', 14, 224),
(226, 13, 'L''Aversion pour sa propre espèce', 24, '2023-12-01', 14, 225),
(227, 14, 'Le Privilège des jeunes', 24, '2023-12-08', 14, 226),
(228, 15, 'L''Odeur du problème', 24, '2023-12-15', 14, 227),
(229, 16, 'Le Mage de la longévité', 24, '2023-12-22', 14, 228),
(230, 17, 'Prends bien soin de toi', 24, '2024-01-05', 14, 229),
(231, 18, 'L''Examen de sélection des mages de premier rang', 24, '2024-01-12', 14, 230),
(232, 19, 'Stratégie bien pensée', 24, '2024-01-19', 14, 231),
(233, 20, 'Kanne et Lawine', 24, '2024-01-26', 14, 232),
(234, 21, 'Le Monde de la magie', 24, '2024-02-02', 14, 233),
(235, 22, 'Désormais des rivaux', 24, '2024-02-09', 14, 234),
(236, 23, 'La Conquête du donjon', 24, '2024-02-16', 14, 235),
(237, 24, 'Un clone parfait', 24, '2024-02-23', 14, 236),
(238, 25, 'La Faiblesse du clone', 24, '2024-03-01', 14, 237),
(239, 26, 'La Hauteur de la magie', 24, '2024-03-08', 14, 238),
(240, 27, 'Le Temps des adieux', 24, '2024-03-15', 14, 239),
(241, 28, 'Ce serait embarrassant la prochaine fois', 24, '2024-03-22', 14, 240);

-- ============================================================
-- 7. TÂCHES, PRESTATAIRES & DIFFUSION
-- ============================================================

INSERT INTO Participer_tache (ID_employe, ID_episode, ID_anime, role_specifique, nb_heure) VALUES
(7, 9, 6, 'Écriture du script épisode pilote', 30.00),
(8, 11, 7, 'Supervision chara-design Nasa & Tsukasa', 40.00),
(9, 12, 8, 'Montage de l''épisode 1', 25.00),
(10, 14, 9, 'Enregistrement de la bande-son Jazz', 90.00),
(11, 15, 10, 'Composition du thème principal Vogel im Käfig', 75.00),
(12, 214, 13, 'Composition de la bande originale de Frieren', 120.00);

INSERT INTO Sous_traiter (ID_entreprise, ID_anime) VALUES
(1, 6), -- Yostar sur Log Horizon
(2, 9), -- Graphinica sur Bebop
(3, 10);-- Half HP Studio sur SnK

INSERT INTO Diffuser (ID_anime, ID_diffuseur) VALUES
(6, 1),         -- Log Horizon sur Crunchyroll
(7, 1), (7, 2), -- Tonikaku Kawaii sur Crunchyroll & Netflix
(8, 2),         -- Death Note sur Netflix
(9, 3), (9, 2), -- Cowboy Bebop sur TV & Netflix
(10, 1), (10, 2),-- SnK sur Crunchyroll & Netflix
(13, 1);        -- Frieren sur Crunchyroll

-- ============================================================
-- 8. DÉPENSES SUPPLÉMENTAIRES
-- ============================================================

INSERT INTO Depense (ID_depense, date_depense_production, montant, categorie_depense, motif, ID_anime) VALUES
(7, '2013-07-10', 80000.00, 'Licence', 'Acquisition droits d''adaptation LN', 6),
(8, '2020-01-15', 50000.00, 'Marketing', 'Promo avant première Shibuya', 7),
(9, '2006-08-01', 120000.00, 'Salaires', 'Doublage Seiyuu (Light & L)', 8),
(10, '1997-12-10', 300000.00, 'Musique', 'Session orchestre live Cowboy Bebop', 9),
(11, '2023-08-20', 150000.00, 'Marketing', 'Avant-première spéciale Frieren au ciné', 13);
