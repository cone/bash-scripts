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
host=$1
test=$( ping -c 1 $host | grep icmp | wc -l )
if [ $test -eq 0 ]
then
  echo "The host doesn't accept pings"
else
  echo "The host replied back!"
fi

# Cicles
while read line; do
  response=$(curl --write-out "%{http_code}\n" --silent --output /dev/null "$line")
  echo $line: $response
done < test.txt