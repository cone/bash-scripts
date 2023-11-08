#!/bin/zsh

# WHILE
# reading from a file
while read line; do
  response=$(curl --write-out "%{http_code}\n" --silent --output /dev/null "$line")
  echo $line: $response
done < test.txt

# reading from user input
while read line
do
  echo "$line"
done
# in the last line we can specify the origin like: 'done < "${1:-/dev/stdin}"'' and
# if we pass a file path as an argument like "./loops.sh ./test.txt" it will print the content of the file!

# based on an increment
number=1
while [ $number -lt 10 ]
do
  echo "$number"
  number=$(( number+1 ))
done
