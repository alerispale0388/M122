#!/usr/bin/env bash
#
# Name: Zahlenraten.sh
# ***************************************
# SYNOPSIS: Zahlenrate.sh
# Ausgeführt in Konsole von IntelliJ
#
# Description: Dieses Skript ist ein kleines Spiel. Sie müssen eine
# Zahl zwischen 1 und 20 erraten. Sie haben dafür 5 Leben
#
# Ablauf:
# Zahl zufällig generieren lassen
# Versuche anzeigen und überprüfen
# Zahl des Spielers einlesen
# Ist die Eingabe eine Zahl oder nicht
# Wird wiederholt bis die Zahl erraten wurde oder keine Leben übrig sind
# Ausgabe ob man gewonnen oder verloren hat
#
# Autor: Alessio Rispoli
# Datum: 05.10.2021

clear
onlyNumbers='^[0-9]+$'
randomGeneratedNumber=$[$RANDOM %20 +1]
lives=5

echo "Bitte geben Sie eine Zahl zwischen 1 und 20 ein:"

until [[ $randomGeneratedNumber -eq $input ]]; do
  if [[ $lives -gt 0 ]]; then
    echo ""
    echo "Leben: $lives"
    read input
    if [[ $input =~ $onlyNumbers ]] ; then
      if [[ $randomGeneratedNumber -eq $input ]]; then
          echo ""
          echo "Sie haben die Zahl erraten!"
          echo ""
      elif [[ $input -gt $randomGeneratedNumber ]]; then
          ((lives=lives-1))
          echo "Die Zahl ist kleiner als $input"
      else
          ((lives=lives-1))
          echo "Die Zahl ist grösser als $input"
      fi
    else
      echo "$input ist keine Zahl!"
    fi
  else
    echo ""
    echo "Sie haben 5 Versuche gehabt und die Zahl nicht erraten..."
    echo "Die Zahl war $randomGeneratedNumber"
    echo ""
    exit
  fi
done
