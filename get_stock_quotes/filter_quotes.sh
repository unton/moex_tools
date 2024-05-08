#!/usr/bin/bash

all_quotes=$(./get_all_quotes.sh)
filter=$(cat "$1")

for ticker in $filter 
do
	tickerUC=$(echo "$ticker" | tr '[:lower:]' '[:upper:]')
	quote=$(sed -nE "s/.*\[\"$ticker\",\s*([0-9]+.?[0-9]*)\].*/\1/Ip" <<< "$all_quotes")
	printf "%s\t%s\n" "$tickerUC" "$quote" 
done
