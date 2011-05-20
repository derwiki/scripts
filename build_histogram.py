#!/usr/bin/python

import collections
import datetime
import sys
import time


def bucket_log(log_filename, date_format='%Y-%m-%d %H:%M:%S', bucket_seconds=10, verbose=False, format_output=False):
    bucket_seconds = int(bucket_seconds)
    from_ts = lambda ts: datetime.datetime.fromtimestamp(ts * bucket_seconds)

    buckets = collections.defaultdict(int)
    with open(log_filename) as logfile:
        for line in logfile:
            ts = time.mktime(
                time.strptime(line.strip(), date_format))
            buckets[ts // bucket_seconds] += 1

    if verbose:
        for ts, count in sorted(buckets.items()):
            bucket = from_ts(ts)
            print "[%s] %s" % (bucket.strftime(date_format), count)

    if format_output:
        format_func = lambda ts: from_ts(ts).strftime(date_format)
    else:
        format_func = from_ts
    return sorted((format_func(ts), count) for ts, count in buckets.iteritems())

if __name__ == '__main__':
    try:
        bucket_log(*sys.argv[1:4], verbose=True)
    except IOError, e:
        print 'Error reading file: %s' % e
