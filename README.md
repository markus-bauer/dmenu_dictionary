# Search a textfile with grep and output the results with dmenu/rofi
## Description
The script can be used as a quick way to look up words in a dictionary.

## Usage
- set a shortcut to start the script. I use the i3 window-manager:
~~~~
bindsym Mod1+0 exec bash $HOME/Dropbox/mydictionaries/dmenu_grep_dict.sh "$HOME/Dropbox/mydictionaries/frde.txt"
bindsym Mod1+9 exec bash $HOME/Dropbox/mydictionaries/dmenu_grep_dict.sh "$HOME/Dropbox/mydictionaries/ende.txt"
~~~~
- Type in search. The script pipes the string to grep (regex search is possible, e.g. \<Hello).
- Dmenu/rofi displays the lines that match the search (output of grep).
- Selecting one of the result will copy the whole line to the clipboard (using xclip).

## Dictionary files
I use the dictionaries from www.dict.cc. You can download them as txt-files at http://www.dict.cc/?s=about%3Awordlist. I'm not allowed to upload the files here, but I've included an example file (example_dict.txt).

## Test
~~~~
bash dmenu_grep_dict.sh "./exampledict.txt" 
~~~~
