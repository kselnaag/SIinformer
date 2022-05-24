# **SamIzdat informer**

----
This is a simple `bash` script for observing [SamIzdat](http://samlib.ru "http://samlib.ru") books you'd like to follow. The tool consists of 2 files: `si.sh` - bash script and `booklist.txt` - config file placed in the same directory.
## Reqirements: 
Make sure utils used in this script are installed and available from standart path: `wc`, `sed`, `curl`, `iconv`, `grep`, `tail`.
## ./booklist.txt
```
#_Унесенные_ветром
http://samlib.ru/m/metelxskij_n_a/
16/05/2022
#_Земли_меча_и_магии
http://samlib.ru/g/georgiewich_j/
07/10/2021
#_Пятнистый_дракон
http://samlib.ru/p/perejaslawcew_a/

====END====
```
Config file has a human-readable format where the first line is the BOOK_TITLE `#_Унесенные_ветром`, the second line is the PAGE_LINK of the book page `http://samlib.ru/m/metelxskij_n_a/` and the third one is the LAST_UPDATE time `16/05/2022`. You should fill this file with any books you interested in and close it with the `====END====` line. If you just added the book you should leave LAST_UPDATE line empty like `#_Пятнистый_дракон` case. This line will be filled automatically by script. Save this file and start `./si.sh`.
## ./si.sh
```
$ ./si.sh
SI START
*
*
#_Пятнистый_дракон - http://samlib.ru/p/perejaslawcew_a/
SI DONE
```
If the book page was not updated the script types `*` symbol to the console, if the page was updated there are the BOOK_TITLE and the PAGE_LINK of the book page printed. LAST_UPDATE line for this book will be updated in the config file.

This way of manual script starting seems not a good idea but in practice it's enough to see rare changes. You  can use this script on your own way as a base for more complex automation.

----
#### Links: 
[SamIzdat](http://samlib.ru/long.shtml "http://samlib.ru/long.shtml")
