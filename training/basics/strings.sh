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
# remove blank spaces
echo "Hello world" | tr -d '[:blank:]'
# => Helloworld

# We wrap in double quotes to prevent issues with blank spaces
# and also prevent wildcard expansion. For that reason, many
# developers wrap variables in double quotes e.g. arr=("$@")
arr=("c*" "utils" "filesystem")
echo ${arr[@]}
# => c* utils filesystem
echo "a{z,u,l}"
# => a{z,u,l}
# without wrapping in double quotes:
arr=(c* utils filesystem)
echo ${arr[@]}
# => commands comments.sh conditionals.sh utils filesystem
echo a{z,u,l}
# => az au al
