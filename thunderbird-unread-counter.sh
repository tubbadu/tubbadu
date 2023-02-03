#!/usr/bin/bash

#TODO: add multiple accounts support (loop on a list of files)

birdtray="$HOME/git/birdtray/build/birdtray"
dataString1=$($birdtray --dump-mork /home/tubbadu/.thunderbird/iek1wpzc.default-release/ImapMail/imap.gmail.com/Unread.msf | grep numMsgs)
dataString2=$($birdtray --dump-mork /home/tubbadu/.thunderbird/iek1wpzc.default-release/ImapMail/imap.gmail-1.com/Unread.msf | grep numMsgs)
unread1=$(($(echo "$dataString1" | awk '{print $NF}') /2)) # this account is counted double, who knows why
unread2=$(($(echo "$dataString2" | awk '{print $NF}') /1))

unread=$(($unread1 + $unread2))
echo $unread

if [[ $unread -gt 0 ]]; then
	echo "{PlasmoidIconStart}mail-mark-unread-new{PlasmoidIconEnd}"
	echo "{PlasmoidStatusStart}active{PlasmoidStatusEnd}"
else
	echo "{PlasmoidIconStart}mail-mark-unread{PlasmoidIconEnd}"
	echo "{PlasmoidStatusStart}passive{PlasmoidStatusEnd}"
fi
echo "{PlasmoidTooltipStart}$unread unread mail{PlasmoidTooltipEnd}"