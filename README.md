# bkp-single-latest
Batch script for backup of latest file of specific .ext in folder. 

* Copies only one file, the latest created by .ext
* Removes ALL existing files in dest folder before new copy
* Skips copy if filename already exist
* Supports filename with spaces

# params to set
```
srcDir="C:\source"
set destdir="C:\bkp"
set ext=bak
```
