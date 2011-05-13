#!/usr/bin/python

import collections
import datetime
import os
import pprint
import sys

def bucket_log(log_filename, date_format=None, power_of_ten=None):
    date_format = date_format or '%Y-%m-%d %H:%M:%S'
    power_of_ten = power_of_ten or 1
    def date_string_to_bucket(date_string):
        date = datetime.datetime.strptime(date_string.strip(), date_format)
        # break into 10 minute buckets by stripping minutes digit
        #TODO this only works for values in (1, 2)
        return date.strftime('%Y-%m-%d %H:%M')[:-1 * power_of_ten] + ('0' * power_of_ten)

    buckets = collections.defaultdict(int)
    with open(log_filename) as logfile:
        for line in logfile:
            buckets[date_string_to_bucket(line)] += 1

    for event_datetime, count in sorted(buckets.items()):
        print "[%s] %s" % (event_datetime, count)
    return

if __name__ == '__main__':
    data_filename = sys.argv[1]
    date_format = None
    assert os.path.exists(data_filename)

    if len(sys.argv) > 2:
        date_format = sys.argv[2]
        try:
            datetime.datetime.now().strftime(date_format)
        except:
            raise Exception("Invalid datetime format: %s" % date_format)

    power_of_ten = int(sys.argv[3]) if len(sys.argv) > 3 else None

    print bucket_log(data_filename, date_format, power_of_ten)
