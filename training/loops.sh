#!/bin/zsh

# reading from a file
while read line; do
  response=$(curl --write-out "%{http_code}\n" --silent --output /dev/null "$line")
  echo $line: $response
done < test.txt

# based on an increment
number=1
while [ $number -lt 10 ]
do
  echo "$number"
  number=$(( number+1 ))
done
