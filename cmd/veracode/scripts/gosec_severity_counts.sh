#!/usr/local/bin/bash

# display gosec report 'severity_id' counts
#   arg $1 is gosec output report file name
#
#   Original file in https://github.com/logrhythm repo 'siem' direcory 'cmd/veracode'
#   Copied file in https://github.com/logrhythm repo 'pubsubbeat' directory 'cmd'
#   Copied file in https://github.com/logrhythm repo 'sophoscentralbeat' directory 'cmd'

echo "$1 ALL  `grep '"severity":' $1 | wc -l`"
echo "$1 HiGH `grep '"severity": "HIGH"' $1 | wc -l`"
echo "$1 MED  `grep '"severity": "MEDIUM"' $1 | wc -l`"
echo "$1 LOW  `grep '"severity": "LOW"' $1 | wc -l`"
