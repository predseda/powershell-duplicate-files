**This project serves mainly as my Github Actions CI/CD hello world project!**

# About
Powershell script `duplicate_files.ps1` compares (recursively) files in a directory
(by comparing their hashes). If a duplicate file is detected, it is moved
to a directory specified by parameter.

The script and the log file contain non-English strings, because I created it for my relative
who can't speak English.

# How to execute
```
.\duplicate_files.ps1 -SrcDir <src-dir> -DstDir <dst-dir> -LogFile <log-file>
```
Where:
* `<src-dir>` is a directory with files where you want to find and remove duplicate files  
* `<dst-dir>` is a directory where duplicate files will be moved; **should be an existing directory!**
* `<log-file>` is path to a file which will contain logs, in [CSV](https://en.wikipedia.org/wiki/Comma-separated_values) format;
  this file will be created automatically; **file extension should be** `.csv`

# License
This project is licensed under [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/)
