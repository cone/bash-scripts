#!/bin/zsh

# ----- cd ------
# enter folder
cd mydir
# go up
cd ..
# enter home
cd ~
cd $HOME
cd ~myuser # where "myuser" can be the name of any existing user

# ----- echo ------
# print variable
MyVar="This is my variable"
echo MyVar # prints "MyVar"
echo "The value of my variable is: ${MyVar}"
# We can avoid the carriage return when using "echo"
echo -n "You are the user: "
whoami

# ----- sleep ------
echo "Hello"
sleep 2
echo "I slept for two seconds!"

# ----- mkdir ------
# create dir
mkdir mydir
# to avoid error if the "mkdir" command is runned more than once,
# we can add the "-p" flag to re-create that directory
mkdir -p mydir

# ----- touch ------
# create file
touch myfile

# ----- rm ------
# remove file
rm myfile
# remove directory
rm -rf mydir

