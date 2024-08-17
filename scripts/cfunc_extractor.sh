#!/bin/bash

cat $1 | grep -E '^[[:space:]]*[a-zA-Z_][a-zA-Z0-9_]*[[:space:]]+[a-zA-Z_][a-zA-Z0-9_]*[[:space:]]*\(.*\)[[:space:]]*\{?' | grep -vE '^[[:space:]]*(if|for|while|switch|else|return|goto)\b' | sed 's/$/;/'
