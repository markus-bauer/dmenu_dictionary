#!/bin/bash
# DESCRIPTION
# general use :  grep a textfile, output to dmenu/rofi
# SETTINGS
# grep -E -i :   extended and ignore case is enabled

dict="$1"

p=""
d=""

#(1) create the search string for dmenu
#--dmenu
# DMENU="dmenu -p grep: -l 20 -i -fn Hack-10"
#--rofi 
DMENU="rofi -regex -location 2 -width 100 -dmenu -p lookup: -l 20 -i -fn Hack-10"

p=$(echo ""| $DMENU)

if [ "$p" != "" ]
then
    # prepare string for grep (for french dictionary: replace a,e,i,c with general equivalents to make search for accented characters easier)

    DMENU="rofi -regex -location 2 -width 100 -dmenu -p select: -l 20 -i -fn Hack-10"

    p="$(echo "$p" | sed "s/a/\[\[=a=\]\]/g")"
    p="$(echo "$p" | sed "s/e/\[\[=e=\]\]/g")"
    p="$(echo "$p" | sed "s/i/\[\[=i=\]\]/g")"
    p="$(echo "$p" | sed "s/c/\[\[=c=\]\]/g")"

    #(2) call locate with p and create dmenu from results:
    d=$(grep -E -i "$p" $dict | sort | $DMENU)  
fi

#(3) copy to clipboard
if [ "$d" != "" ]
then
    # be carefull $d can be anything you type into dmenu/rofi 
    echo "$d" | xclip -selection c
fi
