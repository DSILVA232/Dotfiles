#!/bin/bash

echo what directory would you like to organise relative to THE HOME DIR
read WORKING_DIR
find "$HOME/$WORKING_DIR" -maxdepth 1 -type f -print0 |
	while IFS= read -r -d '' file; do
		ext="${file##*.}"

        [[ "$ext" == "deb" || "$ext" == "tmp" ]] && continue

		
		mkdir -p "$HOME/$WORKING_DIR/$ext"

        
        mv --backup=numbered "$file" "$HOME/$WORKING_DIR/$ext/"

        
	done



