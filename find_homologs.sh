#!/bin/bash

query_file="$1"
subject_file="$2"
output_file="$3"

blastp -query "$query_file" -subject "$subject_file" -outfmt "6 sseqid pident qlen length" > temp.tmp
awk '$4 > $3 * 0.9 && $2 > 30' temp.tmp > "$output_file"
count=$(wc -l < "$output_file")
echo "Match Count: $count"


