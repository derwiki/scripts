#!/bin/bash
# Usage: subtrach.sh bigfile.txt tosubtract.txt > filtered_file.txt
grep --mmap -vFf $2 $1
