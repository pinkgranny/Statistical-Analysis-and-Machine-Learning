# Shell Commands to Process Data

Knowledge of shell programming is necessary for data processing purpose, in Unix enviroment.Specially processing text data.
I start of with some basic shell commands for instance counting files and finding text using grep and then go forward, with more complex examples of shell scripting for processing data.

## Basic Shell Commands  

* Finding number of files present in a directory:

```
$ ls -l|wc -l
83
```

## Advanced Shell Scripting  

* Creating Subdirectories with filename and putting the files into them:  

```
$ for file in *.csv; do mkdir -- "${file%.csv}"; mv -- "$file" "${file%.csv}"; done  

~/myfolder/
       |______ ajhaslf.csv
       |______ oiueed.csv
       |______ dsflije.csv  
       
       
 ~/myfolder/
       |______ ajhaslf
                   |____ajhaslf.csv
       |______ oiueed
                   |____oiueed.csv
       |______ dsflije
                   |____dsflije.csv

```
## Putting character at begining and end of everyline

* Useful for converting text files to csv : https://www.shellhacks.com/sed-awk-add-end-beginning-line/

* Putting prefix
```
sed -e 's/^/"/' file > file.new
```

* Putting postfix
```
sed 's/$/"/' file > file.new
```
