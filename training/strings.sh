#!/bin/zsh

# Compare if two strings are equal
str="abc"
str2="bcde"

if [[ "$str" == "$str2" ]]; then
  echo "strings are equal"
else
  echo "strings are different"
fi
# Using /bin/bash we get the same result with single square brackets:
# 'if [ "$str" == "$str2" ]'

# Compare if one string is smaller than the other
strlen=${#str}
str2len=${#str2}

if (( strlen < str2len )); then
  echo "first string is smaller"
elif (( strlen > str2len )); then
  echo "second string is smaller"
else
  echo "both strings are equal"
fi

# Transform strings
str="ABC"
str2="abc"
# to lowercase
echo "${str:l}"
# to uppercase
echo "${str2:u}"
# capitalize
echo "${(C)str1}"