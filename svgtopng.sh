#!/bin/bash
COUNT=0

echo Looking in path $1
echo Converting to dpi $2
echo Sending to path $3

DPI=$2
DESTPATH=$3
FILEARRAY=( $(find $1/* ) )
TOTAL="${#FILEARRAY[@]}"

mkdir $3

# echo ${FILEARRAY[@]}

for var in ${FILEARRAY[@]}
do
	s=${var##*/}
	base=${s%.svg}
	echo 'converting' $var ' to ' $DESTPATH/$base.png
	inkscape -f $var -d=$DPI -e $DESTPATH/$base.png
	let COUNT=COUNT+1
	# PERCENTAGE="$[COUNT/TOTAL*100]" | bc
	echo completed $COUNT of $TOTAL
	echo '*****'
done

echo "All done! Output sent to $2"