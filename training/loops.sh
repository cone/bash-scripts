#!/bin/zsh

# FOR
for i in {1..5}
do
  echo $i
done
# same as "for i in 1 2 3 4 5"

# using evaluation of expression
for (( i=0; i<=10; i++ ))
do
  if [ $i -gt 5 ]
  then
    break # exiting the loop
  elif [ $i -eq 3 ]; then
    continue # skip iteration and continue
  fi

  echo $i
done
# => 0 1 2 4 5

# WHILE
# reading from a file
while read line; do
  response=$(curl --write-out "%{http_code}\n" --silent --output /dev/null "$line")
  echo $line: $response
done < utils/loops/test.txt

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

# UNTIL
number=1
until [ $number -ge 10 ]
do
  echo "$number"
  number=$(( number+1 ))
done


