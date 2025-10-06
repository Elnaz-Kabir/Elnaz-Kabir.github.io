#!/bin/bash
# build.sh – updates the date in jemdoc and builds HTML

# Get the current date
DATE=$(date +"%B %d, %Y")

# Replace __DATE__ with today's date temporarily and build
for file in *.jemdoc; do
    sed "s/__DATE__/$DATE/" "$file" > temp.jemdoc
    jemdoc -o "${file%.jemdoc}.html" temp.jemdoc
done

rm temp.jemdoc
echo "✅ Built HTML with updated date: $DATE"
