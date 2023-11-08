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
