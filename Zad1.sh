#!/bin/bash

# Pobieranie argumentów i uzupełnianie brakujących informacji z wejścia użytkownika
if [ $# -lt 4 ]; then
    read -p "Podaj imię: " imie
    read -p "Podaj nazwisko: " nazwisko
    read -p "Podaj rok urodzenia: " rok_urodzenia
    read -p "Podaj nazwę pliku: " plik
else
    imie=$1
    nazwisko=$2
    rok_urodzenia=$3
    plik=$4
fi

if [ -z "$imie" ]; then
    read -p "Podaj imię: " imie
fi

if [ -z "$nazwisko" ]; then
    read -p "Podaj nazwisko: " nazwisko
fi

if [ -z "$rok_urodzenia" ]; then
    read -p "Podaj rok urodzenia: " rok_urodzenia
fi

if [ -z "$plik" ]; then
    read -p "Podaj nazwę pliku: " plik
fi

# Obliczanie wieku użytkownika
aktualny_rok=$(date +%Y)
wiek=$(($aktualny_rok - $rok_urodzenia))

# Wypisywanie powitania i wieku użytkownika
echo "Witaj $imie $nazwisko! Masz $wiek lat."

# Funkcja obliczająca silnię rekurencyjnie
function silnia_rekurencyjnie {
    if [ $1 -eq 0 ]; then
        echo 1
    else
        silnia_1=$(silnia_rekurencyjnie $(($1 - 1)))
        echo $(($1 * $silnia_1))
    fi
}

# Funkcja obliczająca silnię przez pętlę
function silnia_petla {
    if [ $1 -eq 0 ]; then
        echo 1
    else
        wynik=1
        for (( i=1; i<=$1; i++ ))
        do
            wynik=$(($wynik * $i))
        done
        echo $wynik
    fi
}

# Obliczanie silni i dopisywanie informacji do pliku
wynik_silni_rekurencyjnie=$(silnia_rekurencyjnie $wiek)
wynik_silni_petla=$(silnia_petla $wiek)

echo "$imie,$nazwisko,$rok_urodzenia,$wiek,$wynik_silni_rekurencyjnie,$wynik_silni_petla" >> $plik.txt