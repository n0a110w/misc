#!/bin/sh

LINK=https://psychedelicsalon.com/members/terence-mckenna-sound-bites/
FILE=/tmp/temp.html

curl -s "$LINK" | egrep '.*\.mp3' > "$FILE"

cat "$FILE" | while read line
do
	MP3_FILE=$(echo $line | grep -o '".*"' | tr -d \")
	wget --quiet "$MP3_FILE"
done
