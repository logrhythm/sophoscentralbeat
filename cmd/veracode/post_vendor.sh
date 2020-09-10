#!/usr/local/bin/bash

# Build component veracode zip and Create gosec result issue file
# Post cleanup Step: restore 'vendor' directory 
#   Since build creates new 'vendor' directory

# Assume starting at github.com/logrhythm/sophoscentralbeat directory
rm -r vendor/ 
git restore vendor
git status