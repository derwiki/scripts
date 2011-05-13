#!/bin/bash
# Usage: json2distribution file.json 4 10
#  1st param is input file
#  2nd param is what " split group is the email address
#  3rd param is top X domains/counts to grab

cut -d'"' -f $2 $1 | cut -d'@' -f 2 | sort | uniq -c | sort -rn | head -n $3
