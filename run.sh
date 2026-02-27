#!/bin/bash

pip install requests urllib3 pyprotectorx >/dev/null 2>&1

# Auto split numbers
split -n l/10 numbers.txt numbers_

mv numbers_aa numbers1.txt
mv numbers_ab numbers2.txt
mv numbers_ac numbers3.txt
mv numbers_ad numbers4.txt
mv numbers_ae numbers5.txt
mv numbers_af numbers6.txt
mv numbers_ag numbers7.txt
mv numbers_ah numbers8.txt
mv numbers_ai numbers9.txt
mv numbers_aj numbers10.txt

run_bot() {

FILE=$1

BATCH=5
TOTAL=$(wc -l < "$FILE")
START=1

while [ "$START" -le "$TOTAL" ]
do

(
sed -n "${START},$((START+4))p" "$FILE"
echo
echo
) | python bot.py

START=$((START+BATCH))

sleep 2

done

}

run_bot numbers1.txt &
run_bot numbers2.txt &
run_bot numbers3.txt &
run_bot numbers4.txt &
run_bot numbers5.txt &
run_bot numbers6.txt &
run_bot numbers7.txt &
run_bot numbers8.txt &
run_bot numbers9.txt &
run_bot numbers10.txt &

wait

echo "✅ 10 parallel bots finished"
