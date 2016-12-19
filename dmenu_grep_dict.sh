#!/bin/bash

dict="$1"

function create_search {
    # create the search string for dmenu

    p=""
    #--- dmenu ---
    # DMENU="dmenu -p grep: -l 20 -i -fn Hack-10"

    #--- rofi ---
    DMENU="rofi -regex -location 2 -width 100 -dmenu -p lookup: -l 20 -i -fn Hack-10"
    p=$(echo ""| $DMENU)
}

function search_and_show {
    d=""
    # prepare string for grep (for french dictionary: replace a,e,i,o,u,c with general equivalents)

    DMENU="rofi -regex -location 2 -width 100 -dmenu -p results: -l 20 -i -fn Hack-10"

    #p="$(echo "$p" | sed "s/a/\[\[=a=\]\]/g")"
    p="$(echo "$p" | sed "s/a/\[aàáâäåæǎăãảȧạḁāąⱥȁấầẫẩậắằẵẳặǻǡǟȁȃ\]/g")" 
    p="$(echo "$p" | sed "s/e/\[eèéêëěĕẽḛẻėëēȩę\]/g")"
    p="$(echo "$p" | sed "s/i/\[iìíîï\]/g")"
    p="$(echo "$p" | sed "s/o/\[oòóôöœ\]/g")"
    p="$(echo "$p" | sed "s/u/\[uùúûü\]/g")"
    p="$(echo "$p" | sed "s/c/\[cç\]/g")"

    echo "$p"

    # call grep with p and create dmenu from results:
    d=$(grep -E -i "$p" $dict | sort | $DMENU)  # grep -E -i:   extended and ignore case is enabled
}

function copy_to_clipboard {
    # copy selection to clipboard
    # be carefull, $d can be anything you type into dmenu/rofi 
    echo "$d" | xclip -selection c
}

function mainloop {
    create_search
    if [ "$p" != "" ]; 
        then search_and_show
    else
        exit
    fi

    if [ "$d" != "" ]; 
        then copy_to_clipboard
    else
        mainloop
    fi
}
mainloop
