#!/bin/bash

# Jeżeli nie podano nazwy pliku, zapytaj użytkownika o nią
if [[ -z $1 ]]; then
    read -p "Podaj nazwę pliku: " nazwapliku
else
    nazwapliku=$1
fi

# Sprawdzenie czy plik istnieje
if [[ ! -e "$nazwapliku" ]]; then
    echo "Plik $nazwapliku nie istnieje!"
    exit 1
fi

# Sprawdzenie czy ścieżka skryptu jest w $PATH, jeżeli nie, dodaj ją
if [[ ! ":$PATH:" == *":$(pwd):"* ]]; then
    export PATH="$PATH:$(pwd)"
fi

# Tworzenie nowego katalogu i przenoszenie pliku
if [[ -d "daneUsera" ]]; then
    rm -r "daneUsera"
fi
mkdir "daneUsera"
cp "$nazwapliku" "daneUsera/$nazwapliku"

# Wyświetlanie zawartości i dopisywanie do pliku
ls >> "daneUsera/$nazwapliku"
cat "daneUsera/$nazwapliku"
