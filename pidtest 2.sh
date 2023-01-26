#!/bin/bash     
# pidtest.sh : gibt PID, PPID  sowie die Variablen TESTVAR1 und TESTVAR2 aus
#                vor Ausführung folgendes eingeben:
#                TESTVAR1=T1; export TESTVAR1
#                TESTVAR2=T2
#author         :Jochen Reinholdt
#date           :20180618
#version        :1      
#usage          :./pidtest
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================

echo PID: $$
echo PPID: $PPID
echo Shell: $SHELL
echo TESTVAR1: $TESTVAR1
echo TESTVAR2: $TESTVAR2

