#!/usr/bin/python
import sys
import json

if __name__ == "__main__":
    if len(sys.argv) < 2:
        from textwrap import dedent
        print dedent("""
            Usage:
              Takes a file with a JSON dictionary on each line and extracts keys to a tab seperated CSV output
                  ex:
                  $ cat addresses.json | json2csv.py id email_address tracking_id
                  123	user@example.com	XYZ

                  $ json2csv.py field1 email id < input.json > output.csv
            """)
        sys.exit(-1)

    for line in sys.stdin:
        sys.stdout.write('\t'.join(str(json.loads(line)[key]) for key in sys.argv[1:]) + '\n')

