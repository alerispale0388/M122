#!/bin/bash
# Name: 04-FileDiff.sh - Zeilen überprüfen zweier Dokumente
# -----------------
# SYNOPSIS: 04-FileDiff.sh [File1] [file2]
# Description: Das Script überprüft die Zeilen zweier definierten Dokumenten.
# Die unterschiedlichen Zeilen werden gekennzeoichnet und die Anzahl unterschiedlichen Zeilen ausgegeben.
#
# 04-FileDiff.sh file1 file2
# file1: Ist das erste Dokument
# file2: Ist das zweite Dokument
#
# Autor: Alessio Rispoli
# Datum: 02.10.2021

echo "Dokument 1: $1"
echo "Dokument 2: $2"
echo ""

#Überprüfung der Dokumente
if [[ -f "$1" && -f "$2" ]]; then
  echo "Zeilenausgabe:"
  # Variablen setzen, welches Dokument hat mehr Zeilen
  if [[ $(wc -l < "$1") -gt $(wc -l < "$2") ]];
  then
    biggerFile=$1
    smallerFile=$2
  else
    biggerFile=$2
    smallerFile=$1
  fi

  #Zeilenanzahl aus dem grösseren Dokument. +1 weil die Länge bei 0 beginnt.
  differentRows=0
  amountRowsBiggerFile=$(wc -l < "$biggerFile")

  #Zeile definiere, bei der das Skript startet
  i=1

  #While geht durch die Files durch bis amountRowsBiggerFile erreicht wird.
  while [[ $i -le $amountRowsBiggerFile ]]
  do
    #Zeile des grösseren Dokumentes
    currentRowBiggerFile=$(sed -n ${i}p "$biggerFile")
    #Zeile des kleineren Dokumentes
    currentRowSmallerFile=$(sed -n ${i}p "$smallerFile")

    echo ""
    echo "$i: $currentRowBiggerFile"
    echo "$i: $currentRowSmallerFile"

    #Überprüfung ob Zeilen unterschiedlich sind
    if [[ "$currentRowBiggerFile" != "$currentRowSmallerFile" ]]; then
      ((differentRows=differentRows+1))

      echo "Zeile $i ungleich"
    fi
    ((i=i+1))
  done

  echo ""
  echo "Insgesamt sind $differentRows Zeilen ungleich"
  echo ""
else
  echo "Ungültige Dokumentangabe"
fi
