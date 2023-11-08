#!/bin/zsh

# Ask for input
echo "What's your name?"
read myvar
echo "Hi ${myvar}"

# We can use any of the commands we use in the console
pwd
ls -a

# Argument pass: ./test.sh hello world
arg1=$1
arg2=$2
echo "The arg 1 is $1. The arg 2 is $2"
echo "The arg 1 is ${arg1}. The arg 2 is ${arg2}"
# result: "The arg 1 is hello. The arg 2 is world"

# the parameter $0 contains the name of the script file
echo $0 # => ./input_and_output.sh

# we can get the parameters as an array
args=("$@")
echo ${args[0]} ${args[1]} ${args[2]} # => hello world
# we can also print all the args with: "echo $@"
# we can see the length of the args array with: "echo $#"

# we can display uer input
while read line
do
  echo "$line"
done < "${1:-/dev/stdin}" # we specify standard input as the source
# if we pass a file path as an argument like "./loops.sh ./test.txt"
# it will print the content of the file!

# reading from user input
while read $input1 $input2
do
  echo $input1 $input2
done
# if we specify more that one word, for instance: one two three
# "one" will be stored in $input1 and the rest ("two three") in $input2.
# If we need the three value to be stored ins separate variables, we would
# need to create a third variable
