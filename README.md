# bkp-single-latest
Batch script for backup of latest file of specific .ext in folder. 

* Copies only one file, the latest created by .ext
* Removes ALL existing files in dest folder before new copy
* Skips copy if filename already exist
* Supports filename with spaces
* Does NOT support "en-dash"

# Avoid source files with "en-dash"
* In Norwegian Windows (and other languages too) - If you have manually copies the src-file and generated an "en dash" (long-dash) the file may fail to copy.
* The long en-dash is not recognized as normal dash (-) and this fails the source-file to be read.
* To keep yourself sane, avoid copying such files.
* More information:
https://stackoverflow.com/questions/54682337/batch-find-and-replace-en-dash-with-hyphen-using-windows-batch-command

# Params to set in script
Set the source dir, destination dir and file-extension by editing:
```
srcDir="C:\source"
set destdir="C:\bkp"
set ext=bak
```
