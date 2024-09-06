#!/bin/bash

query_file="$1"
subject_file="$2"
output_file="$3"

blastn -query "$query_file" -subject "$subject_file" -outfmt "6 sseqid pident length qlen" > temp.tmp
awk '$3 == $4 && $2 == 100' temp.tmp > "$output_file"
count=$(wc -l < "$output_file")
echo "Perfect Match Count: $count"


