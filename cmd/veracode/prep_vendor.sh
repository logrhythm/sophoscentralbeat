#!/usr/local/bin/bash

# Build component veracode zip and Create gosec result issue file
# Prepare Step: remove 'vendor' directory 
#   Since build creates new 'vendor' directory

# Assume starting at github.com/logrhythm/sophoscentralbeat directory
rm -r vendor/ 