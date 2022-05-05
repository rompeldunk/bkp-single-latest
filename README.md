# bkp-single-latest
Batch script for backup of latest file of specific .ext in folder. 

* Copies only one file, the latest created by .ext
* Removes ALL existing files in dest folder before new copy
* Skips copy if filename already exist
* Supports filename with spaces

# en dash bug
* If you have manually copies the src-file and generated an "en dash" the file will fail to copy.
https://stackoverflow.com/questions/54682337/batch-find-and-replace-en-dash-with-hyphen-using-windows-batch-command

# params to set
```
srcDir="C:\source"
set destdir="C:\bkp"
set ext=bak
```
