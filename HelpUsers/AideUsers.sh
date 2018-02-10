#!/bin/bash
# -*- coding: utf-8 -*-

###################################################################################################
#           Programme d'aide aux nouveaux utilisateurs de l'environnement Linux                   #
#                              Auteur : ENTEZAM Samuel                                            #
#                              Lancement : ./AideUsers.sh                                         #
###################################################################################################

echo -e "---------- Menu pour utilisateurs ---------- \n"
echo " 1°) Afficher le contenu d'un répertoire"
echo " 2°) Créer un répertoire"
echo " 3°) Détruire un répertoire"
echo " 4°) Déplacer un fichier"
echo " 5°) Détruire un fichier"
echo " 6°) Quitter"
echo "Votre choix est : "
read choix
if [ $choix == 1 ]
	then
	echo "Vous avez saisit le choix n°1 qui correspond à Afficher le contenu d'un répertoire"
	clear
	echo "-----Bienvenue dans la section Afficher le contenu d'un répertoire ----- "
	echo "Nom du répertoire à afficher : "
	read Nom
	echo "Le répertoire $Nom va s'afficher : "
	afficheNom=$(sudo find ~/ -name $Nom)
	echo "Le répertoire $Nom se trouve ici --> $afficheNom"
	echo "Choisir le chemin correspondant : (Ex : /home/Images) : "
	read path
	cd $path
	echo "Déplacement vers $path"
	ls -la
	cd
	./AideUsers.sh
fi
if [ $choix == 2 ]
	then
	echo "Vous avez saisit le choix n°2 qui correspond à Créer un répertoire"
	clear
	echo "----- Bienvenue dans la section Créer un répertoire -----"
	echo "Nom du répertoire à Créer : "
	read Nom2
	echo "Le répertoire $Nom2 va être créé : "
	clear
	mkdir $Nom2
	echo "Le répertoire $Nom2 à bien été créé : "
	ls -la | grep $Nom2
	./AideUsers.sh
fi
if [ $choix == 3 ]
	then
	echo "Vous avez saisit le choix n°3 qui correspond à Détruire un répertoire"
	clear
	echo "----- Bienvenue dans la section Détruire un répertoire -----"
	echo "Nom du répertoire à Détruire : "
	read Nom3
	echo "Donner le chemin où est situé le répertoire $Nom3 (Ex : var/www/html) : "
	read Chemin3
	echo "Déplacement vers $Chemin3"
	cd $Chemin3
	echo "Le répertoire $Nom3 va être détruit"
	rmdir $Nom3
	echo "Le répertoire $Nom3 à été supprimé avec succès : "
	cd $Nom3
	cd
	./AideUsers.sh
fi
if [ $choix == 4 ]
	then
	echo "Vous avez saisit le choix n°4 qui correspond à Déplacer un fichier"
	clear
	echo "----- Bienvenue dans la section Déplacer un fichier -----"
	echo "Nom du fichier à déplacer (fichier) : "
	read Rep
	echo "Où voulez-vous déplacer le fichier $Rep (Donner le chemin, Ex : Bureau/etc...) : "
	read Chemin
	echo "Le fichier $Rep va donc être déplacer vers $Chemin"
	mv $Rep ~/$Chemin
	echo "Le fichier à donc été déplacé vers $Chemin"
	./AideUsers.sh
fi
if [ $choix == 5 ]
	then
	echo "Vous avez saisit le choix n°5 qui correspond à Détruire un fichier"
	clear
	echo "----- Bienvenue dans la section Détruire un fichier----- "
	echo "Nom du fichier à supprimer : "
	read Fich
	echo "Donner le chemin où est situé le fichier $Fich (Ex : var/www/html) : "
	read Chemin2
	echo "Déplacement vers $Chemin2"
	cd $Chemin2
	echo "Le fichier $Fich va être détruit"
	rm -i $Fich
	echo "Le fichier $Fich à été supprimé avec succès : "
	cat $Fich
	cd
	./AideUsers.sh
fi
if [ $choix == 6 ]
	then
	echo "Vous avez saisit le choix n°6 qui correspond à Quitter le menu"
	echo "Vous allez être redirigé(e) dans votre home directory"
	cd
fi
