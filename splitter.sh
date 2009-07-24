
FILE=$1
LINES=10

if [ ! -f "$FILE" ]; then
	echo "File not found"
	exit 1
fi

HEADER=`head -1 $FILE`

split -l $LINES $FILE ${FILE}_part_

for I in ${FILE}_part_*; do
	if [ $I != ${FILE}_part_aa ]; then
		echo $HEADER > $I.csv
		cat $I >> $I.csv
		rm $I
	else
		mv $I $I.csv
	fi	
done

