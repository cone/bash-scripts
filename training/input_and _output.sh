#!/bin/zsh

echo "Hello"
sleep 2
echo "I slept for two seconds!"
MyVar="This is my variable"
echo MyVar # prints "MyVar"
echo "The value of my variable is: ${MyVar}"

# Ask for input
echo "What's your name?"
read myvar
echo "Hi ${myvar}"

# We can use any of the commands we use in the console
pwd
ls -a

# We can avoid the carriage return when using "echo"
echo -n "You are the user: "
whoami

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
done < "${1:-/dev/stdin}"
# if we pass a file path as an argument like "./loops.sh ./test.txt"
# it will print the content of the file!

# Displaying the result of running something: run inside $()
echo $(ifconfig)

# Redirect to file
echo "Hello" > generated.txt

# Open editor. Ctrl + d to save ane exit
# this replaces all the text
cat > generated.txt
# this appends to any existing content
cat >> generated.txt
