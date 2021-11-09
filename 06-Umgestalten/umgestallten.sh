#!/bin/bash
# Autor: Alessio Rispoli
# Datum: 09.11.2021
# Name: umgestalten.sh
#
# SYNOPSIS: umgestalten.sh readFile writeFile
# Ausgeführt in Konsole von IntelliJ
#
# Description: Dieses Skript ist ein Filter, bei dem nur
# die wichtigsten Informationen vom das ExportSmall.spl / Export.spl angezeigt werden
#
# Ablauf:
# umgestalten.sh ExportSmall.spl output.txt eingeben im Terminal
# wird geschaut ob Text zwischen 0 - 25, über 25 ist englisch
# Nur die zweite und vierte Spalte wird ausgegeben
# Hauptnummer gefiltert
# Ausgabe outputFile

input=$1
output=$2

#Regex Filter 0-2
awk '$1 ~ /^[0-2]$/ ' "$input" | \
#Regex Filter 0-25 generieren (ueber 25 ist englisch)
awk '$2 ~ /^[0-25]$/'             | \
# -F Nur Spalte 2 und 4
awk -F"'" '{print $2,"     ",$4}' | \
#Hauptnummer wird gefiltert
awk 'length($1)==7' > "$output"
