# IFA_LINUX_DEV enthält Musterlösungen und Beispiele für die Kurse
# "Bash Scripting Basics" und "IT-Betrieb und Monitoring"
# ./lib                : Verzeichnis für Funktionsbibliotheken
# addiere.sh           : demonstriert prüfung von $1 und $2 auf integer und addiert sie
# adress_array.sh      : Lesen von Datei, speichern von key/value in assoziatives Array und Suche
# analyze-step1.sh     : Auswertung der Spalten CPU idle, Datum und Uhrzeit in der Ausgabe von Vmstat
# analyze-step2.sh     : Auswertung der Spalten CPU idle, Datum und Uhrzeit in der Ausgabe von Vmstat
# analyze-step3a.sh    : Auswertung der Spalten CPU idle, Datum und Uhrzeit in der Ausgabe von Vmstat
# analyze-step3b.sh    : Auswertung der Spalten CPU idle, Datum und Uhrzeit in der Ausgabe von Vmstat
# analyze-step4.sh     : Auswertung der Spalten CPU idle, Datum und Uhrzeit in der Ausgabe von Vmstat
# analyze-step5.sh     : Auswertung der Spalten CPU idle, Datum und Uhrzeit in der Ausgabe von Vmstat
# analyze-step6.sh     : Auswertung der Spalten CPU idle, Datum und Uhrzeit in der Ausgabe von Vmstat
# analyze-step7.sh     : Auswertung der Spalten CPU idle, Datum und Uhrzeit in der Ausgabe von Vmstat
# analyze1.sh          : Auswertung der Spalten CPU idle, Datum und Uhrzeit in der Ausgabe von Vmstat
# and_demo.sh          : Demonstriert den gebrauch der UND-Verknüpfung mit -a oder &&
# append_sh.sh         : another demonstration of a for loop, iterating over all file names
# ausgabe.sh           : Ausgabe nach stdout und stderr
# autobreak.sh         : Durchläuft alle Parameter, bis “auto“ gefunden wurde
# backup1.sh           : Dateien mit Endung .png Als Optionsparameter werden Quell- und Zielverszeichnis übergeben
# backupd1.sh          : Erzeugt eine Kopie des Verzeichnisses, das in $1 angegeben wurde
# backupd2.sh          : Variante von backupd1.sh
# backupd3.sh          : Variante von backupd1.sh
# backupd4.sh          : Variante von backupd1.sh
# backupd5.sh          : Variante von backupd1.sh
# backupd6.sh          : Variante von backupd1.sh
# casedemo.sh          : Demonstration der case-Anweisung
# chkdf1-variante1.sh  : Variante zu chkdf1.sh
# chkdf1-variante2.sh  : Variante zu chkdf1.sh
# chkdf1-variante3.sh  : Variante zu chkdf1.sh
# chkdf1-variante4.sh  : Variante zu chkdf1.sh
# chkdf1.sh            : Auswertung des Outputs von df, Alarm, wenn Schwellwert überschritten ist
# chkdf2.sh            : Ähnlich chkdf1.sh, mit Konfoigurationsfile und Optionen
# chkdf2_step0.sh      : Ester Schritt zur Aufgabe chkdf2.sh 
# chkdf2_step1.sh      : 1. Versuch zur Aufgabe chkdf2.sh
# chkdf2_step2.sh      : 2. Schritt zur Aufgabe chkdf2.sh
# cmpfiles.sh          : compare files in 2 directories
# config_array.sh      : Aufgabe2-8
# count_until.sh       : Demonstration until-Schleife
# countdown1.sh        : Demonstration while-Schleife
# countdown2.sh        : Ausbau countdown1.sh
# countdown3.sh        : Ausbau countdown2.sh
# countlines.sh        : liest die Zeilen einer Textdatei und gibt sie nummeriert aus
# delusers.sh          : löscht $numusers  benutzer mit dem namen $prefix$nr 
# dreieck.sh           : Gibt in zwei for-schleifen ein Dreieck ausSternen aus
# endlos.sh            : demonstriert eine Endlos-Schleife mit while
# eval_demo1.sh        : Dynamische Kommandoausführung mit eval
# exec_demo.sh         : Zeigt den Effekt von exec im Script
# exec_redirect.sh     : zeigt Ausgabeumlenkung für alle Kommandos
# execd_script.sh      : Genutzt von exec_demo.sh
# existiert_datei.sh   : Prüft die Existenz eines Verzeichniseintrags 
# filetypes.sh         : for-Schleife über Parameter + tests auf verschiedene Dateitypen
# for_loop_args.sh     : Ausgabe von allen Elementen von $@ Versuch 2
# fordemo.sh           : zeigt ein weiteres Beispiel für for
# fork_demo.sh         : Demo fork mit &
# forked_script.sh     : # forked_script.sh
# ftest1.sh            : Demonstriert den Test von Funktionen
# funclibdemo.sh       : demonstriert das sourcen von Funktionen aus Bibliotheken
# functest1.sh         : Demo Definition und Aufruf von Funktionen
# functest2.sh         : Demo Funktion mit Argumenten
# functest3.sh         : Demo Funktion mit Rückgabewert
# functest4.sh         : Demo globale und lokale Variablen
# functest5.sh         : Demo lokale Variablen 2
# gerade.sh            : demonstriert den Modulo-Operator und if .. then .. else
# getopts_demo.sh      : eine einfache Anwendung von getopts
# getopts_demo2.sh     :  zeigt eine komplexere Verwendung von getopts
# getopts_full.sh      : zeigt eine komplexe Verwendung von getopts
# getopts_simple.sh    : zeigt eine einfach Verwendung von getopts
# global_local.sh      : demonstriert globale und lokale Gültigkeit von Variablen
# hallo.sh             : Demo von read und echo
# klammer-vergleich.sh : Vergleich ganzer Zahlen mit ((  ))
# klammer_demo.sh      : Demonstriert den Einsatz von Klammerung bei logischen Operatoren
# minigrep1.sh         : Sucht ein einfaches Muster in einer Textdatei
# minigrep2.sh         : Fügt minigrep1 diverse Prüfungen hinzu
# mkscript1.sh         : Erzeugt einen "Kopf" mit Kommentarzeilen für ein neues Script und ruft Editor auf
# mkscript2.sh         : Ausbau von mkscript1.sh
# mkscript3.sh         : Ausbau von mkscript2.sh
# mkstruct.sh          : Legt eine Verzeichnisstruktur für einen Kurs an
# mkstruct1.sh         :  Version mit globaler Variable
# mkstruct2.sh         : Ausbau mkstruct mit Default-Wert
# mkstruct3.sh         : Version mit Positionsparameter
# mkstruct4.sh         : Version mit 2. Positionsparameter
# mkstruct5.sh         : Version mit Logdatei
# mkstruct6a.sh        : Version
# mkstruct6b.sh        : Version mit diversen Prüfungen
# mkusers.sh           : Legt eine Anzahl anonymer Benutzer mit Passwort an 
# neg_demo.sh          : Demonstriert den Einsatz des Negationsoperators !
# newline_char.sh      : demonstriert die Verwendung des Zeilenumbruchs in Variablen
# oddeven.sh           : prüft mit dem Modulo-Operator %, ob der 1. Parameter eine gerade Zahl ist
# or_demo.sh           : # or_demo.sh    :Demonstriert die ODER-Verknüpfung mit -o oder II
# papagei1.sh          : liest eine Zeile und gibt sie wieder aus, bis ENDE eingegeben wird
# papagei2.sh          : liest eine Zeile und gibt sie wieder aus, bis ENDE eingegeben wird
# paramtest1.sh        : Gibt den Namen des Scripts und die Anzahl der Parameter aus
# paramtest2.sh        : Gibt den Inhalt der ersten 9 Parameter aus
# paramtest3.sh        : Gibt die Parameter 1-9 nacheinander aus
# paramtest4.sh        : Prüft, ob zwei Parameter übergeben wurden
# paramtest5.sh        : Prüft, wieviele  Parameter übergeben wurden und gibt diese aus
# paramtest5a.sh       : Variante zu paramtest5.sh 
# paramtest6.sh        : Prüft in for-Schleife, wieviele  Parameter übergeben wurden und gibt diese aus
# paramtest7.sh        : Prüft den Typ der Dateien, die als Parameter übergeben wurden
# pipecollect.sh       : empfängt Textzeilen über eine named Pipe
# pipereader.sh        : liest aus named Pipe
# pipewriter.sh        : schreibt in named Pipe
# printf_demo.sh       : demonstriert die formatierte Ausgabe mit printf
# psarray.sh           : Speicherung der Ausgabe von ps in einem Array
# pseudo_boolean.sh    : Demonstriert den Einsatz von /bin/true
# readconfig1a.sh      : Lesen einer Datei mit 2 Spalten mit Trennzeichen in ein aasoziatives Array
# readconfig1b.sh      : Variante zu readconfig1a.sh
# readconfig1c.sh      : Variante zu readconfig1a.sh mit IFS=
# readloop.sh          : fragt wiederholt eine Benutzereingabe ab
# rechner.sh           : Ein Kommandozeilen-Rechner. Demonstriert Zusammenspiel case und while
# schreibrecht.sh      : Demonstriert den Gebrauch der UND-Verknüpfung mit -a oder &&
# secondline.sh        : Ausgabe der 2. Zeile der als Parameter angegebenen Dateien
# select_demo.sh       : Demonstriert ein Menu mit select
# star_vs_at.sh        :  for argument  in "$*"; do
# stderr_demo.sh       : demonstriert die generelle Umlenkung von
# sterne.sh            : Schreibt mit for soviele Sterne, wie in $1 angegeben
# sterne1.sh           : Gibt in einer for-schleife 10 sterne aus
# sterne2.sh           : Gibt in einer for-schleife soviel sterne aus, wie in Parameter1 angegeben ist
# subshell_falle.sh    : demonstriert Subshell nach | while ...
# subshell_falle2.sh   : zeigt die PID der Subshell nach |
# sum_params.sh        : Prüft, wieviele  Parameter übergeben wurden und summiert sie
# summe.sh             : Funktionsdefinition summe(): Summiert die Argumente
# trapdemo1.sh         : fängt verschiedene Signale mit trap ab
# typ.sh               : Diverse Prüfungen mit test bzw [ ]
# use_func_lib.sh      : demonstriert die Nutzung einer Funktionsbibliothek
# usefunctions.sh      : benutzt Funktionen aus zwei Bibliotheken
# vergleiche0.sh       : Prüft die Parameter auf = > und > 
# vergleiche1.sh       : Prüft die Parameter auf = > und > und ob sie überhaupt Zahlen enthalten
# vergleiche2.sh       : Alternative  Version zu vergleiche1.sh
# vergleiche3.sh       : Weitere  Version von "vergleiche"
# vergleiche4.sh       : Weitere Version des Skripts "vergleiche"
# vorzeichen.sh        : prüft den übergebenen wert auf positiv, negativ oder 0
# wait_demo.sh         : Demo fork und wait
# while_summe.sh       : Summiert alle übergebenen Parameter in while-Schleife
# yesno1.sh            : Eingabeaufforderung, bis "Y", "y", "N" oder "n"  eingegeben wurde
# yesno2.sh            : Eingabeaufforderung, bis  "Y", "y", "N" oder "n" eingegeben wurde
# zeilen.sh            : Liest Datei zeile für Zeile, gibt die Datei mit Zeilennummern und die Anzahl Zeilen aus
# zeilen1.sh           : Variante von zeilen.sh
# zeilen2.sh           : Variante von zeilen.sh mit cat und Pipe und einer Überraschung
# zerocontinue.sh      : Teilt den 1. Parameter durch alle weiteren Parameter. Demo von continue
