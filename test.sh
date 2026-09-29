#!/bin/bash

echo "=========================================="
echo " PL/SQL IF-ELSE AUTOGRADING"
echo "=========================================="

FILE="answers.sql"

if [ ! -f "$FILE" ]; then
    echo "FAIL: answers.sql not found."
    exit 1
fi

echo "PASS: answers.sql found."

CONTENT=$(cat "$FILE" | tr '[:upper:]' '[:lower:]')

if echo "$CONTENT" | grep -q "set serveroutput on"; then
    echo "PASS: SET SERVEROUTPUT ON found."
else
    echo "FAIL: SET SERVEROUTPUT ON not found."
    exit 1
fi

if echo "$CONTENT" | grep -q "declare"; then
    echo "PASS: DECLARE found."
else
    echo "FAIL: DECLARE not found."
    exit 1
fi

if echo "$CONTENT" | grep -Eq "marks[[:space:]]+number"; then
    echo "PASS: marks NUMBER found."
else
    echo "FAIL: marks NUMBER not found."
    exit 1
fi

if echo "$CONTENT" | grep -q "if"; then
    echo "PASS: IF statement found."
else
    echo "FAIL: IF statement not found."
    exit 1
fi

if echo "$CONTENT" | grep -q "then"; then
    echo "PASS: THEN found."
else
    echo "FAIL: THEN not found."
    exit 1
fi

if echo "$CONTENT" | grep -q "else"; then
    echo "PASS: ELSE found."
else
    echo "FAIL: ELSE not found."
    exit 1
fi

if echo "$CONTENT" | grep -Eq "end[[:space:]]+if"; then
    echo "PASS: END IF found."
else
    echo "FAIL: END IF not found."
    exit 1
fi

if echo "$CONTENT" | grep -Eq "marks[[:space:]]*>=[[:space:]]*50"; then
    echo "PASS: marks >= 50 found."
else
    echo "FAIL: marks >= 50 not found."
    exit 1
fi

if echo "$CONTENT" | grep -q "student has passed"; then
    echo "PASS: Passed message found."
else
    echo "FAIL: Passed message not found."
    exit 1
fi

if echo "$CONTENT" | grep -q "student has failed"; then
    echo "PASS: Failed message found."
else
    echo "FAIL: Failed message not found."
    exit 1
fi

echo ""
echo "=========================================="
echo " ALL TESTS PASSED"
echo "=========================================="

exit 0
