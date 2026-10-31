# ProjetDB_Zhan_Lin
Mini projet de base de donnée
29/09/2026 15:39
On a modifié le dictionnaire que l'IAG nous proposé, on a suppprimé les attributs : Territoire Géographique, Fonction de l'employer, Adresse éléctronique pro

MLD :

Auteur =(ID_auteur, Nom)

Editeur =(ID_editeur, nom_editeur)

Realisateur =(ID_Realisateur, Nom_Realisateur)

Genre =(ID_genre, genre)

Employe =(ID_employe, nom_employe, prenom_employe, date_embauche, role_employe, #ID_anime)

Prestataire =(ID_entreprise, specialite, nom_prestataire)

Diffuseur =(ID_diffuseur, nom_diffuseur, type_diffuseur, date_debut_droit, date_fin_diffusion, montant_contrat)

Manga = (ID_manga, Titre, Nombre_de_Tomes, Date_de_publication, #ID_auteur #ID_editeur) 
Anime =(ID_anime, titre_anime, format, date_debut_prod, budget, etat, #ID_manga, #ID_Realisateur)  
Saison=(ID_saison, num_saison, date_sortie_saison, #ID_anime)     
Episode=(ID_episode, numero_episode, titre_episode, duree, date_episode,#ID_saison,#ID_episode_précédent) 
Depense =(ID_depense, date_depense_production, montant, categorie_depense, motif, #ID_anime, )        

Manga_Genre =(#ID_manga, #ID_genre)                                                 
Anime_Genre =(#ID_anime, #ID_genre)                                                 
Participer_tache =(#ID_employe, #ID_episode,#ID_anime, role_specifique, nb_heure)    
Sous traiter = (#ID_entreprise, #ID_anime)         
Diffuser = (#ID_anime,#ID_diffuseur) 

