#!/usr/bin/zsh

xgamma -gamma $(( $(xgamma 2>&1 | awk '{print $NF}') +$1 ))