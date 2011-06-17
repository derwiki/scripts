#!/usr/bin/python
import sys
import json
import traceback

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
        try:
            json_dict = json.loads(line.strip())
            def format_output(s):
               if type(s) in (int, float): return str(s)
               else: return s

            sys.stdout.write('\t'.join(format_output(json_dict[key]) for key in sys.argv[1:]) + '\n')
        except IOError, ioe:
            # this is bizarre, but when this error is thrown there don't seem
            # to be adverse side effects
            pass
        except Exception, e:
            sys.stderr.write("%s\n" % e)
            sys.stderr.write(traceback.format_exc())
            sys.stderr.write('Error parsing line: ' + line)

