#!/bin/bash
# Commands used to generate separate .csv files for each sheet in mutation_bias.xlxs.
# Commands should be run in directory with that file and there should be a mutation_by_species folder
# Create a single csv file with each sheet separated by the sheet name which we will then extract.
xlsx2csv --all mutation_bias.xlsx  > /tmp/tmp.csv

# Create bash array with species abbr names
mapfile -t TMP < <(grep -o '[A-Z][a-z][a-z][a-z]$' /tmp/tmp.csv)

# Get number of sheets from length of TMP array
IMAX="${#TMP[@]}"

# Create separate files, indexed by numerical values that correspond with bash array element
for I in $(seq 1 $IMAX); do J=$(($I-1)); xlsx2csv -s $I mutation_bias.xlsx > /tmp/$J.csv; done

# move and rename files. Note bash arrays are indexed starting at 0
for I in $(seq 0 $((IMAX-1))); do mv /tmp/$I.csv mutation_by_species/${TMP[$I]}.csv; done

#check files
for I in $(seq 0 $((IMAX-1))); do sdiff mutation_by_species/${TMP[$I]}.csv /tmp/tmp.csv |less; done
