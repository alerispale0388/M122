#!/bin/bash
# Autor: Alessio Rispoli
# Datum: 09.11.2021
#
# Alle .txt File auflisten
# ls -l | grep "\.txt$"

# Ersetzt alle die im [ ] durch ein u
# ls -l | sed -e "s/[aeio]/u/g"

# Alle ausgelesenen files werden in ls-l.txt File geschrieben
# ls -l > ls-l.txt

# Gibt die Error Meldung,wenn das File nicht vorhanden ist.
# cat fileNotExisting.txt 2> error.txt

# /dev/null lässt Fehlermeldung verschwinden
# cat fileNotExisting.txt 2> /dev/null

# Joint zwei Files miteinander
# cat list-1 list-2 list-3 | sort | uniq > final.list

sort testfile.txt| uniq -c | sort -nr

man $1 | head -n6 | tail -n1 | cut -b 8-
