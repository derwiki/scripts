#!/bin/bash

echo "Searching .msg files..."
for file in *.msg; do
  if grep -q "Feedback-Type: abuse" $file; then
    grep "To: " $file | grep -v "abuse@" | grep --max-count=1 -o "[[:alnum:]+\.\_\-]*@[[:alnum:]+\.\_\-]*" >> $1
  fi
done
sort -o ${1}-sorted.log $1
echo "Total matches:"
wc -l ${1}-sorted.log
uniq ${1}-sorted.log > ${1}-sorted-uniq.log
echo "Unique matches:"
wc -l ${1}-sorted-uniq.log
