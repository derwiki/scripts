#!/bin/bash
# Usage: subtract.sh bigfile.txt tosubtract.txt > filtered_file.txt
grep --mmap -vFf $2 $1
