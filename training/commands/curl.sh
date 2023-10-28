#!/bin/zsh

url="http://speedtest.ftp.otenet.gr/files/test1Mb.db"

# Download keeping the same file name (-O)
curl ${url} -O

# Download replacing the name (-o for "options" or just redirect output with ">")
curl ${url} -o myNewFile.db
curl ${url} > myNewFile.db

# See information of the file (doesn't download the file)
curl ${url} -I
