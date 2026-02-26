#!/bin/bash

pip install requests urllib3 pyprotectorx >/dev/null 2>&1

FILE="numbers.txt"
BATCH=5

TOTAL=$(wc -l < $FILE)
START=1

while [ $START -le $TOTAL ]
do
    echo "Running numbers $START to $((START+BATCH-1))"

    (
    sed -n "${START},$((START+BATCH-1))p" $FILE
    echo
    echo
    ) | python bot.py

    START=$((START+BATCH))

    echo "Waiting 3 seconds..."
    sleep 3

done

echo "✅ All numbers completed"