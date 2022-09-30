#!/usr/bin/bash

x=$(bluetoothctl info | grep "Battery Percentage:" | cut -d "(" -f2 | cut -d ")" -f1)
echo $x"%"