#!/bin/bash
################################################################################
#                       Modulprüfung LUIT Februar 2021                         #
#                               aufgabe-02.sh                                  #
#     Themen: Kommando tar, Sortierung von Ausgaben, Optionen mit getopts      #
#                  Funktionen, Fehlermeldungen und Exit-Codes                  #
################################################################################
# Schreiben Sie ein Script, das die unter Hauptfunktionen und Fehlerbehandlung #
# genannten Anforderungen erfüllt:                                             #
#                                                                              #
# Hauptfunktionen                                                              #
#  Gibt eine sortierte Liste der Inhalte eines TAR-Archivs aus.                #
#  Die Sortierreihenfolge wird durch die Angabe einer Option beim Aufruf       #
#  des Scripts bestimmt. Es kann entweder nach Dateigrösse oder Dateinamen     #
#  sortiert werden und die Sortierreihenfolge kann auf- oder absteigend sein.  #
#  a) Mit der Option -s ASC wird die Liste numerisch aufsteigend               #
#     nach Dateigrösse sortiert ausgegeben (kleine Dateien zuerst).            #
#  b) Mit der Option -s DESC wird die Liste numerisch absteigend               #
#     nach Dateigrösse sortiert ausgegeben.                                    #
#  c) Mit der Option -n ASC wird die Liste alphabetisch aufsteigend nach       #
#     Dateinamen sortiert (z.B. anfang.txt vor mitte.txt).                     #
#  d) Mit der Option -n DESC wird die Liste alphabetisch absteigend nach       #
#     Dateinamen sortiert.                                                     #
#  e) Mit der Option -l wird zusätzlich die Anzahl der Dateien im Archiv       #
#     als letzte Zeile ausgegeben (siehe Beispiel).                            #
#  f) Die Optionen können in beliebiger Reihenfolge angegeben werden, der      #
#     Dateiname des TAR-Archivs ist die letzte Angabe auf der Kommandozeile    #
#  g) Ohne Optionen -s oder -n wird aufsteigend nach Dateinamen sortiert.      #
#  h) Mit der Option -h wird nur die folgende Meldung auf stderr ausgegeben:   #
#     "usage: aufgabe-02.sh [-s ASC|DESC] [-l] tar-archive                     #
#             aufgabe-02.sh [-n ASC|DESC] [-l] tar-archive                     #
#             aufgabe-02.sh -h"                                                #
#  i) Bei korrekter Auführung gibt das Skript den Exit-Code 0 zurück           #
#  j) Das Format der Ausgaben entspricht genau den Beispielen                  #
#                                                                              #
# Fehlerbehandlung:                                                            #
#  Wird das Script falsch aufgerufen, wird die folgende Meldung auf stderr     #
#  ausgegeben:                                                                 #
#  "usage: aufgabe-02.sh [-s ASC|DESC] [-l] tar-archive                        #
#          aufgabe-02.sh [-n ASC|DESC] [-l] tar-archive                        #
#          aufgabe-02.sh -h"                                                   #
#  Dann wird das Script beendet und der Exit-Code 1 zurückgegeben.             #
#  Das gilt für die folgenden Fehlermöglichkeiten (k bis o):                   #
#  k) Die Option -h und andere Optionen wurden gleichzeitig angegeben          #
#     (-h schliesst alle anderen Optionen aus)                                 #
#  l) Die Option -s und -n wurden gleichzeitig angegeben                       #
#     (Sie schliessen sich gegenseitig aus).                                   #
#  m) Bei -s oder -n fehlt die Angabe  ASC oder DESC                           #
#  n) Nach -s oder -n steht etwas anderes als ASC oder DESC                    #
#  o) Der Dateiname fehlt                                                      #
#                                                                              #
#  Weitere Fehlerbehandlungen:                                                 #
#  p) Wenn die Datei nicht gefunden wurde, wird die Meldung auf stderr         #
#     ausgegeben:                                                              #
#      "error: file <Dateiname> not found"                                     #
#  q) Das Script gibt m Fall p) den Exit-Code 2 zurück                         #
#  r) Wenn die Datei nicht lesbar ist oder kein TAR-Archiv ist, wird die       #
#     Meldung auf stderr ausgegeben:                                           #
#      "error: tar archive <Dateiname> cannot be opened"                       #
#  s) Das Script gibt im Fall r) den Exit-Code 3 zurück                        #
#                                                                              #
#                                                                              #
# Beispiele (die Datei tarfile ist zum Testen vorhanden):                      #
#                                                                              #
#  $ ./aufgabe-02.sh tarfile # Einfachster Aufruf, keine Optionen              #
#  -rw-rw-r-- ubuntu/ubuntu   592 2021-01-29 16:12 anfang.txt                  #
#  -rw-rw-r-- ubuntu/ubuntu  3552 2021-01-29 16:13 zuletzt.txt                 #
#  -rw-rw-r-- ubuntu/ubuntu  5328 2021-01-29 16:18 mitte.txt                   #
#                                                                              #
#  $ ./aufgabe-02.sh -l -s ASC tarfile # Sortiert nach Grösse. Mit Anzahl.     #
#  -rw-rw-r-- ubuntu/ubuntu   592 2021-01-29 16:12 anfang.txt                  #
#  -rw-rw-r-- ubuntu/ubuntu  3552 2021-01-29 16:13 zuletzt.txt                 #
#  -rw-rw-r-- ubuntu/ubuntu  5328 2021-01-29 16:18 mitte.txt                   #
#  3 items in tar archive                                                      #
#                                                                              #
#  $ ./aufgabe-02.sh -n DESC tarfile # Absteigend Sortiert nach Namen          #
#  -rw-rw-r-- ubuntu/ubuntu  5328 2021-01-29 16:18 mitte.txt                   #
#  -rw-rw-r-- ubuntu/ubuntu  3552 2021-01-29 16:13 zuletzt.txt                 #
#  -rw-rw-r-- ubuntu/ubuntu   592 2021-01-29 16:12 anfang.txt                  #
#                                                                              #
#  $ ./aufgabe-02.sh -l -n XXX tarfile # Fehler: Ungültige Angabe XXX          #
#  usage: aufgabe-02.sh [-s ASC|DESC] [-l] tar-archive                         #
#         aufgabe-02.sh [-n ASC|DESC] [-l] tar-archive                         #
#         aufgabe-02.sh -h                                                     #
#                                                                              #
#  $ ./aufgabe-02.sh -l -s ASC         # Fehler: Keine Datei angegeben         #
#  usage: aufgabe-02.sh [-s ASC|DESC] [-l] tar-archive                         #
#         aufgabe-02.sh [-n ASC|DESC] [-l] tar-archive                         #
#         aufgabe-02.sh -h                                                     #
#                                                                              #
#  $ ./aufgabe-02.sh -l -s ASC gibtsnicht # Fehler: Datei existiert nicht      #
#  error: file gibtsnicht not found                                            #
#                                                                              #
#  $ ./aufgabe-02.sh -l -s ASC aufgabe-02.sh # Fehler: Datei kein tar-Archiv   #
#  error: tar archive aufgabe-02.sh cannot be opened                           #
#                                                                              #
# Hinweise:                                                                    #
#  1. Benennen sie diese Datei nicht um                                        #
#  2. Verwenden Sie Sie keine andere Shell als /bin/bash                       #
#  3. Gehen Sie davon aus, dass dieses Script root-Berechtigung ausgeführt     #
#     wird. Es ist also nicht nötig, vor Kommandos sudo anzugeben.             #
#  4. Sie können Teilpunkte für die Erfüllung einzelner Anforderungen (a-m)    #
#     erreichen.                                                               #
#  5. Bei der häufigen Verwendung der usage-Meldung empfiehlt es sich, eine    #
#     Funktion zu verwenden                                                    #
################################################################################
#               Geben Sie Ihre Lösung nach diesem Kommentar ein                #
################################################################################

usage() {
   echo "usage: $(basename $0) [-s ASC|DESC] [-l] tar-archive" 1>&2
   echo "       $(basename $0) [-n ASC|DESC] [-l] tar-archive" 1>&2
   echo "       $(basename $0) -h" 1>&2
}

count_flag=0
s_flag=0
n_flag=0
sortoptions=''

while getopts s:n:lh opt
do
    case $opt in
	    h) usage
	       help_flag=0
	       exit 0;;
            l) count_flag=1;;
	    s) s_flag=1
	       if ((n_flag==1));then
		 echo '-n and -s are mutually exclusive' 1>&2
		 usage
		 exit 1
	       fi
	       case $OPTARG in
	       	 ASC)  sortoptions='-n -k 3' ;;
	       	 DESC) sortoptions='-n -k 3 -r' ;; 
	         *)    usage
	               exit 1 ;;
               esac ;;
	    n) n_flag=1
	       if ((s_flag==1));then
		 echo '-n and -s are mutually exclusive' 1>&2
		 usage
		 exit 1
	       fi
	       case $OPTARG in
                 ASC)  sortoptions='-k 6' ;;
                 DESC) sortoptions='-k 6 -r' ;;
                 *)    usage
                       exit 1 ;;
               esac ;;
	    ?) usage
	       exit 1 ;;
    esac
done

shift $(( OPTIND - 1 ))
tarfile=$1
if [ -z $tarfile ]; then
   usage
   exit 1
fi
if ! [ -f $tarfile ]; then
    echo "file $tarfile not found" 1>&2
    exit 2
fi
if tar tvf $tarfile >/dev/null 2>&1; then
    tar tvf $tarfile | sort $sortoptions
    if (( count_flag==1 )); then
	lines=$(tar tvf $tarfile | wc -l) 
	echo "$lines items in tar archive"
    fi
else
    echo "error: tar archive $tarfile cannot be opened" 1>&2
    exit 3
fi
exit 0
