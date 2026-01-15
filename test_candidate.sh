# !/bin/bash
# test_candidate.sh ist ein Demo-Script, das mit
# test_script.sh getestet werden kann.
# Testfälle:
# 1. Korrekter Aufruf mit 1 Argument: stdout="Normale Ausgabe", stderr="", Exit-Code=0
# 2. Fehlerhafter Aufruf ohne Argument oder mit mehr als 1 Argument: 
#    stdout="", stderr="Fehlerausgabe", Exit-Code=1

if [ $# -eq 1 ];then
    echo "Normale Ausgabe"
    exit 0
else
    echo "Fehlerausgabe" 1>&2
    exit 1
fi
