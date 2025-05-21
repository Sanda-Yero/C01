#!/bin/bash

echo "=== Compteur de fichiers ==="

# Demander le répertoire (avec gestion des espaces)
read -p "Entrez le chemin du répertoire [défaut : courant] : " repertoire

# Utiliser le répertoire courant si vide
[ -z "$repertoire" ] && repertoire="."

# Vérification du répertoire
if [ ! -d "$repertoire" ]; then
    echo "Erreur : '$repertoire' n'est pas un répertoire valide" >&2
    exit 1
fi

# Méthode 1: ls + wc -l (compte tous les éléments)
echo -n "Méthode ls/wc -l : "
ls -1 "$repertoire" | wc -l

# Méthode 2: Boucle simple (compte uniquement les fichiers)
count=0
for item in "$repertoire"/*; do
    if [ -f "$item" ]; then
        ((count++))
    fi
done
echo "Méthode boucle : $count fichiers"

# Différence expliquée
echo "Note : ls/wc compte tous les éléments, la boucle ne compte que les fichiers"