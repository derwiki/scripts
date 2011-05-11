#!/usr/bin/python
import sys
import json

if __name__ == "__main__":
    if len(sys.argv) < 2:
      print """
Usage:
  Takes a file with a JSON dictionary on each line and extracts keys to a tab seperated CSV output
t     ex:
      $ cat addresses.json | json2csv.py id email_address tracking_id
      123	user@example.com	XYZ

      $ json2csv.py field1 email id < input.json > output.csv
"""
    
    for line in sys.stdin:
        sys.stdout.write('\t'.join(str(json.loads(line)[key]) for key in sys.argv[1:]) + '\n')

