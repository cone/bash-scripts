#!/bin/zsh

# Home dir
# ways to enter home dir
cd ~
cd $HOME
cd ~myuser # where "myuser" can be the name of any existing user

# Create dir
mkdir mydir
# to avoid error if the "mkdir" command is runned more than once,
# we can add the "-p" flag to re-create that directory
mkdir -p mydir

# Check if a directory exists
if [ -d "mydir" ]; then
  echo "mydir dir exists!"
else
  echo "mydir dir doesn't exist"
fi
