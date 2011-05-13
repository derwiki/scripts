#!/usr/bin/python

import collections
import datetime
import sys
import time

def bucket_log(log_filename, date_format='%Y-%m-%d %H:%M:%S', bucket_seconds=10):
    bucket_seconds = int(bucket_seconds)
    
    buckets = collections.defaultdict(int)
    with open(log_filename) as logfile:
        for line in logfile:
            ts = time.mktime(
                time.strptime(line, date_format))
            buckets[ts // bucket_seconds] += 1

    for ts, count in sorted(buckets.items()):
        bucket = datetime.datetime.fromtimestamp(ts * bucket_seconds)
        print "[%s] %s" % (bucket.strftime(date_format), count)

if __name__ == '__main__':
    try:
        bucket_log(*sys.argv[1:4])
    except IOError, e:
        print 'Error reading file: %s' % e
