#!/bin/bash
# test_script.sh testet das script test_candidate.sh
# Getestet werden stdout, stderr und exit-code in zwei Fällen
# Methoden:
# Kommandosubstitution liefert Output auf stdout
# Exit code steht *direkt* nach dem Aufruf des scripts in $?
# Um Output auf stderr zu testen, muss er in eine temporäre Datei umgelenkt werden 
# und dann in einer Variable gespeichert werden

SCRIPT=./test_candidate.sh

fail() {
    echo "❌ FEHLER: $1"
    exit 1
}

pass() {
    echo "✅ OK: $1"
}



# ---------- Test 1: Korrekter Aufruf, genau ein Argument ----------
STDOUT=$($SCRIPT arg1 2>stderr.txt) 
EXITCODE=$?
STDERR=$(cat stderr.txt)

EXPECTED_STDOUT="Normale Ausgabe"
EXPECTED_STDERR=""
EXPECTED_EXIT=0

[[ "$STDOUT" == "$EXPECTED_STDOUT" ]] || fail "Test 1 stdout falsch"
[[ "$STDERR" == "$EXPECTED_STDERR" ]] || fail "Test 1 stderr falsch"
[[ "$EXITCODE" -eq "$EXPECTED_EXIT" ]] || fail "Test 1 Exit-Code falsch"

pass "Test 1 (1 Argument)"

# ---------- Test 2: Fehlerhafter Aufruf, kein Argument ----------
STDOUT=$($SCRIPT 2>stderr.txt)
EXITCODE=$?
STDERR=$(cat stderr.txt)

EXPECTED_STDOUT=""
EXPECTED_STDERR="Fehlerausgabe"
EXPECTED_EXIT=1

[[ "$STDOUT" == "$EXPECTED_STDOUT" ]] || fail "Test 2 stdout falsch"
[[ "$STDERR" == "$EXPECTED_STDERR" ]] || fail "Test 2 stderr falsch"
[[ "$EXITCODE" -eq "$EXPECTED_EXIT" ]] || fail "Test 2 Exit-Code falsch"

pass "Test 2 (kein Argument)"

rm -f stderr.txt
echo
echo "🎉 Alle Tests erfolgreich"
