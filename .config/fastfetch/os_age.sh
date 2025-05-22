#!/usr/bin/env bash
birth_install=$(stat -c %W /)
current=$(date +%s)
days_difference=$(( (current - birth_install) / 86400 ))
echo "$days_difference days"
