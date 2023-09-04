#!/bin/zsh

: '
multi
line
comment'

# If we want to show any comments in the output
# we can use a heredoc delimiter. We can use any name
# for the delimiter
cat << mycustomname
Hello, this is my
comment that will be shown
in the output
mycustomname

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

# Functions
function sayHello {
  echo "Say $arg1"
}
# Or
sayHello2() {
  echo "Say $arg1 2"
}

sayHello
sayHello2

# Displaying the result of running something: run inside $()
echo $(ifconfig)

# Conditionals
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

# Case statement
COUNTRY="Mexico"

case $COUNTRY in

  Mexico)
  echo -n "It's Mexico!"
  ;;

  Cuba)
  echo -n "It's Cuba!"
  ;;

  *)
  echo -n "It's Other!"
  ;;
esac

# Loops
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


# Redirect to file
echo "Hello" > generated.txt

# Open editor. Ctrl + d to save ane exit
# this replaces all the text
cat > generated.txt
# this appends to any existing content
cat >> generated.txt
