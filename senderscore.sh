#!/bin/bash

# senderscore.sh
#
# Log to CSV the SMTP sender scores for blocks of IPs
# System requirements: `host` utility must be installed.
#
# based on information found on:
#  http://blog.highspeedweb.net/2010/08/31/monitor-your-ips-with-senderscore-automatically/

### OVERRIDE THESE >>>>
# First 3 octets of IP address, forward and reversed
static="192.168.0."
staticrev=".1.0.192"

# build a hash table of (label, last IP octet)
declare -A ipranges
ipranges[transactional]="220"
ipranges[bulk]="221 222 223 224 225 226 227"
### OVERRIDE THESE <<<<

zones="score cmplt.rating filtered.rating uus.rating vol.rating"

for zone in $zones; do
  for key in ${!ipranges[@]}; do
    for iprange in ${ipranges[$key]}; do
      for ip in $iprange; do
        revip=${ip}${staticrev}
        fullip=$static$ip
        result=$(host ${revip}.${zone}.senderscore.com)
        # 
        echo $zone,$key,$fullip,${result##*.}
      done
    done
  done
done
