#!/usr/bin/python
import os
import sys

def usage():
    from textwrap import dedent
    print dedent("""
        Usage:
          Subtracts patterns in file from a STDIN. Each pattern should be on a line of it's own
              ex:
              $ subtract.py exclude_these_ids.txt < ids.txt > filtered_ids.txt 
        """)
    sys.exit(-1)

if __name__ == "__main__":
    if len(sys.argv) < 2: usage()

    if not os.path.exists(sys.argv[1]):
        print "File %s does not exist" % sys.argv[1]
        usage()

    blacklist = map(str.strip, open(sys.argv[1]))

    for line in sys.stdin:
        if not any((exception in line) for exception in blacklist):
            sys.stdout.write(line)

