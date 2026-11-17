#!/bin/bash
file=$1
reads=$(grep -c "^@" $file)
gc=$(awk 'NR % 4 == 2' $file | grep -o "[GC]" | wc -l)
total=$(awk 'NR % 4 == 2' $file | tr -d '\n' | wc -c)
percent=$(echo "scale=2; $gc * 100 / $total" | bc)
echo "文件: $file"
echo "Reads数: $reads"
echo "GC含量： $percent%"
