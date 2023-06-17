#!/usr/bin/bash

/sbin/iptables -A OUTPUT -t mangle -p tcp --dport 22 -j TOS --set-tos 0x00 || echo "$(date): gitFix failed" >> /tmp/gitFix.log 
echo "$(date): gitFix succesfully run" >> /tmp/gitFix.log 