#!/usr/bin/env bash
#Autor: Alessio Rispoli
#Datum: 14.9.21
#
# Gibt die Grösser der Dateien und der Verzeichnisse an. -ah schreibt es in lesbare Grössen um, wie KB
du -a
du -ah
#
# Listet nur Verzeichnisse und deren Grösse auf. Der Speicherbedarf wird in einer Variable gespeichert
echo 'Grösse aller Dateien'
du -h
Speicherbedarf=$(du-sh)
echo'Der totale Speicherbedarf beträgt: '$Speicherbedarf
#
#Sortiert die Verzeichnisse und Dateien alphabetisch. sort -r sortiert es umgekehrt
du -ah | sort $2
Speicherbedarf=$(du -sh)
echo 'Der totale Speicherbedarf beträgt: '$Speicherbedarf
