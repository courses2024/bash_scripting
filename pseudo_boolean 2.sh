#!/bin/bash     
# pseudo_boolean.sh : Demonstriert den Einsatz von /bin/true
#date           :20181108
#version        :1      
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================

#
# Die Bash hat keinen Datentyp boolean oder bool. Wahr (true) ist 0, alles Andere falsch (false)
# hier wird das Kommando /bin/true verwendet. Es gibt immer den Exit-Code 0 zurück 
# 
if (( "$1"==true )) 2>/dev/null
then
    echo TRUE
else
    echo FALSE
fi
