#!/usr/bin/python
import sys
import json

if __name__ == "__main__":
    if len(sys.argv) < 2:
      print "Usage:\n\
  Takes a file with a JSON dictionary on each line and extracts keys to a tab seperated CSV output\n\
    ex:\n\
      $ cat addresses.json id email_address tracking_id\n\
      123	user@example.com	XYZ"
    
    for line in sys.stdin:
        sys.stdout.write('\t'.join(str(json.loads(line)[key]) for key in sys.argv[1:]) + '\n')

