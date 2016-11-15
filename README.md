# Search a Textfile with grep and output results with dmenu/rofi
## Description
It can be used as a quick way to lookup words in a dictionary.

## Usage
- set a shortcut to the start the script. I use the i3 window-manager:
~~~~
bindsym Mod1+0 exec bash $HOME/scripts/dmenu_dictionary/dmenu_grep_dict.sh "$HOME/Dropbox/mydictionaries/frde.txt"
bindsym Mod1+9 exec bash $HOME/scripts/dmenu_dictionary/dmenu_grep_dict.sh "$HOME/Dropbox/mydictionaries/ende.txt"
~~~~
- Type in search. The script pipes the searchstring to grep (regex search is possible, e.g. \>Hello)
- dmenu/rofi displays the matches 
- Selecting one of the result will copy the whole line to the clipboard (using xclip)

## Dictionary files
I use the dictionaries from www.dict.cc. You can download them as txt-files at http://www.dict.cc/?s=about%3Awordlist. I'm not allowed to upload the files here, but I've included an example file (example_dict.txt).
