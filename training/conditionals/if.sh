#!/bin/zsh

# not equal: -ne, equal: -eq, lower than: -lt, greater than: -gt
host=$1
test=$( ping -c 1 $host | grep icmp | wc -l )
if [ $test -eq 0 ]
then
  echo "The host doesn't accept pings"
elif [ $test -eq 1 ]; then
  echo "The host replied back! (1)"
else
  echo "The host replied back!"
fi
# if we want to use <,>,==,!=,<=.>=, etc. We need to use (()) instead of []
# e.g. "if (( $test == 0 ))"
# we can also use "and" and "or" operators, several ways we can do that:
#   "if [ $test -gt 0 ] && [ $test -lt 10 ]" using OR "if [ $test -gt 0 ] || [ $test -lt 10 ]"
#   "if [[ $test -gt 0 && $test -lt 10 ]]" using OR "if [[ $test -gt 0 || $test -lt 10 ]]"
#   "if [ $test -gt 0 -a $test -lt 10 ]" using OR "if [ $test -gt 0 -o $test -lt 10 ]"
