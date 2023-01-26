#!/bin/bash     
# or_demo.sh    :Demonstriert die ODER-Verknüpfung mit -o oder II
#date           :20180828
#version        :1.0    
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================

file=$1

# Schreibweise 1 für OR mit -o verknüpfte Prüfungen in einem test
if [ -f $file -o -d $file ]
then
   echo "Datei $file: normale Datei oder Verzeichnis"
# Schreibweise 2 für OR mit 2 tests, mit || verknüpft
elif [ -b $file ] || [ -c $file ]
then
   echo "Datei $file: Character- oder Block-Gerätedatei"
else
   echo "weder noch"
fi
