#!/bin/bash

global_array(){
	item_list=( )
}
add() {
	item_list+=($1)
		
	 

}

remove() {
	local remove=$1
	unset "item_list[$((remove-1))]"
	item_list=("${item_list[@]}")
}


list() {
	for i in "${!item_list[@]}";do
		echo "$((i+1)):${item_list[$i]}"
	done
	echo -e "\n"
}


global_array

while true; do
    printf "What would you like to do\n1: Add\n2: Remove\n3: List items\n4: Exit\n"
    echo -e "\n"
    read -r OPTION
    echo -e "\n"

    if [ "$OPTION" = 1 ]; then
        echo "What item would you like to add?"
        echo -e "\n"
	read -r ITEM
        add "$ITEM"
        echo "Added $ITEM to the list"

    elif [ "$OPTION" = 2 ]; then
        echo "What item number  would you like to remove?"
        read -r ITEM
        remove "$ITEM"
        echo "Number $ITEM was removed from the list"

    elif [ "$OPTION" = 3 ]; then
        echo "-------- List --------"
        list

    elif [ "$OPTION" = 4 ]; then
        break

    else
        echo "That's an invalid choice"
    fi
done
