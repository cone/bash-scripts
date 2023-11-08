#!/bin/zsh

touch test.txt
# Create link. If we use the -s option we create a "symbolic" link
ln -s test.txt test
# we write to the symbolic link
echo "I'm writting to the symbolic link" >> test
# we read using the symbolic link
cat test
