#!/bin/bash
# for_loop_args.sh: Ausgabe von allen Elementen von $@ Versuch 2
for name in $@
do
    echo -n $name
    
    if [ -e $name ]
    then
        echo -n " existiert"
        if [ -f $name ]
        then
            echo " und ist eine normale Datei"
        elif [ -d $name ]
        then
            echo " und ist ein Verzeichnis"
        fi
    else
        echo " existiert nicht"
    fi
done
