#!/usr/local/bin/bash

# display gosec report 'rule_id' counts
#   arg $1 is gosec output report file name
#
#   Original file in https://github.com/logrhythm repo 'siem' direcory 'cmd/veracode'
#   Copied file in https://github.com/logrhythm repo 'pubsubbeat' directory 'cmd'
#   Copied file in https://github.com/logrhythm repo 'sophoscentralbeat' directory 'cmd'

echo "$1 ALL  `grep '"rule_id":' $1 | wc -l`"
echo "$1 G101 `grep '"rule_id": "G101"' $1 | wc -l`"
echo "$1 G102 `grep '"rule_id": "G102"' $1 | wc -l`"
echo "$1 G103 `grep '"rule_id": "G103"' $1 | wc -l`"
echo "$1 G104 `grep '"rule_id": "G104"' $1 | wc -l`"
echo "$1 G105 `grep '"rule_id": "G105"' $1 | wc -l`"
echo "$1 G106 `grep '"rule_id": "G106"' $1 | wc -l`"
echo "$1 G107 `grep '"rule_id": "G107"' $1 | wc -l`"
echo "$1 G110 `grep '"rule_id": "G110"' $1 | wc -l`"
echo "$1 G201 `grep '"rule_id": "G201"' $1 | wc -l`"
echo "$1 G202 `grep '"rule_id": "G202"' $1 | wc -l`"
echo "$1 G203 `grep '"rule_id": "G203"' $1 | wc -l`"
echo "$1 G204 `grep '"rule_id": "G204"' $1 | wc -l`"
echo "$1 G301 `grep '"rule_id": "G301"' $1 | wc -l`"
echo "$1 G302 `grep '"rule_id": "G302"' $1 | wc -l`"
echo "$1 G303 `grep '"rule_id": "G303"' $1 | wc -l`"
echo "$1 G304 `grep '"rule_id": "G304"' $1 | wc -l`"
echo "$1 G305 `grep '"rule_id": "G305"' $1 | wc -l`"
echo "$1 G401 `grep '"rule_id": "G401"' $1 | wc -l`"
echo "$1 G402 `grep '"rule_id": "G402"' $1 | wc -l`"
echo "$1 G403 `grep '"rule_id": "G403"' $1 | wc -l`"
echo "$1 G404 `grep '"rule_id": "G404"' $1 | wc -l`"
echo "$1 G501 `grep '"rule_id": "G501"' $1 | wc -l`"
echo "$1 G502 `grep '"rule_id": "G502"' $1 | wc -l`"
echo "$1 G503 `grep '"rule_id": "G503"' $1 | wc -l`"
echo "$1 G504 `grep '"rule_id": "G504"' $1 | wc -l`"
echo "$1 G505 `grep '"rule_id": "G505"' $1 | wc -l`"
