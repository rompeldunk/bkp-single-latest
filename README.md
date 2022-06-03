# Backup Latest File
Batch script for scheduled backup of the latest created `file.[ext]` in a defined source folder.

* Copies only one file, the latest created by .ext
* Removes ALL existing files in dest folder before new copy
* Skips copy if filename already exist
* Supports filename with spaces
* Does NOT support "en-dash"
* Add every run in backlup.log

# Configuration
Set the source dir, destination dir and file-extension by editing:
```batch
srcDir="C:\source"
set destdir="C:\bkp"
set ext=bak
```

# Avoid source files with "en-dash"
* In some Windows versions (e.g Windows Server 2012) - If you manually copy a file into the same folder you'll get a "Filename – Copy" where the en dash (–) is slightly wider than the hyphen (-) 
* This results in the Unicode error, which makes the filename not readable.
* To keep yourself sane, avoid such filenames and ensure they don't contain the longer en-dash (–)
* Reference:
https://stackoverflow.com/questions/54682337/batch-find-and-replace-en-dash-with-hyphen-using-windows-batch-command

