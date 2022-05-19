#!/usr/bin/bash

if [ -z "$1" ]; then
	echo "Error: missing filename"
elif [ -f "$1" ]; then

	#lpr -o sides=two-sided-long-edge $1
	#break
	
	echo "printing even pages reversed"
	#cupsfilter -o page-set=even outputorder=reverse orientation-requested=6 $1
	pdftk $1 cat 1-endSeven output out.pdf

	echo "insert now the pages into the printer without changing the order, then press enter:"
	read
	echo "printing odd pages"
	cupsfilter -o page-set=odd $1
	
	echo "devo anche ruotare di 180° neh"
	echo "visit https://www.cups.org/doc/options.html for references"
	
else
	echo "Error: file '$1' not found"
fi


# 1 3 5

#dispari
#1 bianco forse
#pari reversed flipped



#even reversed
#odd 
