# Search a textfile with grep and output the results with dmenu/rofi
## Description
The script can be used as a quick way to look up words in a dictionary.

## Usage
- Set a shortcut to start the script. I use the i3 window-manager with these bindings in the i3-config file:
~~~~
bindsym Mod1+0 exec bash $HOME/Dropbox/mydictionaries/dmenu_grep_dict.sh "$HOME/Dropbox/mydictionaries/frde.txt"
bindsym Mod1+9 exec bash $HOME/Dropbox/mydictionaries/dmenu_grep_dict.sh "$HOME/Dropbox/mydictionaries/ende.txt"
~~~~
- The script invokes a dmenu prompt.
- Type in search. The script pipes the string to grep (regex search is possible, e.g. \<Hello\>).
- Dmenu/rofi displays the lines matching the search (output of grep). You can search the results.
- Selecting one of the result with Return or mouse click copies the whole line to the clipboard (using xclip) and closes the menu.
- Pressing escape (or Return with an empty string selected) returns to the search prompt.
- Pressing escape (or Return with an empty string selected) at the search prompt
closes the menu.

## Dictionary files
I use the dictionaries from www.dict.cc. You can download them as txt-files at http://www.dict.cc/?s=about%3Awordlist&l=e. I'm not allowed to upload the files here. 

## Test
- Run directly from the terminal using the test file:
```bash
$ bash dmenu_grep_dict.sh "./exampledict.txt" 
```
