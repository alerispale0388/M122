#!/bin/bash
# Name: 04-FileDiff.sh - Zeilen überprüfen zweier Dokumente
# -----------------
# SYNOPSIS: 04-FileDiff.sh [File1] [file2]
# Description: Das Script überprüft die Zeilen zweier definierten Dokumenten.
# Die unterschiedlichen Zeilen werden gekennzeoichnet und die Anzahl unterschiedlichen Zeilen ausgegeben.
#
# 04-FileDiff.sh file1 file2 um das Skript laufen zu lassen
# file1 und file2 sind die files, die verglichen werden
#
# Autor: Alessio Rispoli
# Datum: 02.10.2021

echo "Document 1: $1"
echo "Document 2: $2"
echo ""

#Überprüfung der Dokumente
if [[ -f "$1" && -f "$2" ]]; then
  echo "Print row:"
  # Variablen setzen, welches Dokument hat mehr Zeilen
  if [[ $(wc -l < "$1") -gt $(wc -l < "$2") ]];
  then
    biggerFile=$1
    smallerFile=$2
  else
    biggerFile=$2
    smallerFile=$1
  fi

  #Zeilenanzahl aus dem grösseren Dokument.
  amountOfUnequalRows=0
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
      ((amountOfUnequalRows=amountOfUnequalRows+1))

      echo "Row $i unequal"
    fi
    ((i=i+1))
  done

  echo ""
  echo "In total are $amountOfUnequalRows rows unequal"
  echo "Script end"
  echo ""
else
  echo "Invalid documents"
fi
