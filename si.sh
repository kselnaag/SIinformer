#!/usr/bin/env bash

echo -e "SIinformer START"

FILENAME="./booklist.txt"
if [ -f "$FILENAME" ]; then
	IFS=' '
	LINES=(`wc -l "$FILENAME"`)
	BOOKS=$(($LINES/3))
	if [ $(($LINES%3)) == 0 ]; then
		for ((IDX=0; IDX < BOOKS; IDX++)); do
			TITLE_IDX=$((IDX*3 + 1))
			LINK_IDX=$((IDX*3 + 2))
			LDATE_IDX=$((IDX*3 + 3))
			
			TITLE=`sed -n "${TITLE_IDX}p" "$FILENAME"`
			LINK=`sed -n "${LINK_IDX}p" "$FILENAME"`
			LDATE=`sed -n "${LDATE_IDX}p" "$FILENAME"`		
			NDATE=`curl --silent "$LINK" | iconv -f cp1251 | grep 'Обновлялось:' | tail -c 12`
			
			ISDATE="^[0-9]{2}\/[0-9]{2}\/[0-9]{4}" # 01/02/1234
			if [[ $NDATE =~ $ISDATE ]]; then
				if [[ $LDATE == $NDATE ]]; then
					echo "*"
				else
					echo -e "$TITLE - $LINK"
					sed -i "${LDATE_IDX}d" "$FILENAME"
					sed -i "${LDATE_IDX}i $NDATE" "$FILENAME"
				fi
			else
				echo -e "WARNING: bad link ! $TITLE - $LINK"
			fi
		done
		echo -e "SIinformer DONE"
	else
		echo -e "\nERROR: $FILENAME wrong format !\n"
	fi
else
	echo -e "\nERROR: $FILENAME did not found !\n"
fi

exit 0
