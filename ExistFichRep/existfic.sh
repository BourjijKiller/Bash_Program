#!/bin/bash
echo -e "Saisir un nom de fichier ou de répertoire"
read saisit
echo -e "Vous avez saisit le nom suivant : $saisit \n"
if [ ! -e "$saisit" ]
	then
	echo -e "$saisit n'existe pas \n"
	exit 1
elif [ -f "$saisit" ]
	then
	echo -e "$saisit est un fichier ordinaire \n"
elif [ -d "$saisit" ]
	then
	echo -e "$saisit est un répertoire courant \n"
fi
droits=$(ls -ld $saisit | cut -d ' ' -f1)
users=$(ls -ld $saisit | cut -d ' ' -f3)
groups=$(ls -ld $saisit | cut -d ' ' -f4)
echo -e "------------- Les droits d'accès de $saisit --------------------- \n"
echo -e "	read write execute \n"
n=1
for i in " users " "groups " " other "
do
	d=${droits:n:3}
	if [ "$d" = "---" ]
		then
		var1="Non"
		var2="Non"
		var3="Non"
	elif [ "$d" = "r--" ]
		then
		var1="Oui"
		var2="Non"
		var3="Non"
	elif [ "$d" = "rwx" ]
		then
		var1="Oui"
		var2="Oui"
		var3="Oui"
	elif [ "$d" = "-wx" ]
		then
		var1="Non"
		var2="Oui"
		var3="Oui"
	elif [ "$d" = "--x" ]
		then
		var1="Non"
		var2="Non"
		var3="Oui"
	elif [ "$d" = "r-x" ]
		then
		var1="Oui"
		var2="Non"
		var3="Oui"
	elif [ "$d" = "rw-" ]
		then
		var1="Oui"
		var2="Oui"
		var3="Non"
	else
		var1="Non"
		var2="Oui"
		var3="Non"
	fi
	echo  " $i $var1  $var2   $var3"
	n=$((n+3))
	echo -e "\n"
done