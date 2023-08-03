#!/usr/bin/bash
tempfile=/tmp/festival-tts-say.sh
# write $@ to a temp text file
echo $@ > $tempfile.txt
# convert it to a wave
text2wave $tempfile.txt -o $tempfile.wav
# play the wav
aplay $tempfile.wav
