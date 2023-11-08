#!/bin/zsh

# Print to screen
echo "Hello World!"
# Print without carriage return with the "-n" option
echo -n "Hello "
echo "World!"
# => Hello World!

# String concatenation
echo "Hello" "World" "Again"
# => Hello World Again
# we can use a "back slash"(\) if the line is too long
echo "Hello" "World" "Again" \
                     "My" "Friends"
# => Hello World Again My Friends

# Using "back slash"(\) interpretation within string
# for that we need to use the "-e" flag
echo -e "Hello\tWorld\tAgain" # using tabs
echo -e "Hello\nWorld\nAgain" # using carriage return
# in some cases the "-e" option is not needed
echo "Hello World \"Again\"" # using double quotes
echo "Hello World Again\!" # using exclamation mark (if it's not escaped it has an odd behavior)

# Displaying the result of running something: echo the result of
# running a command in a subshell $()
echo $(ifconfig)

# Write to file
echo "Hello" > generated.txt

# Open editor. Ctrl + d to save ane exit
# this replaces all the text
cat > generated.txt
# this appends to any existing content
cat >> generated.txt

# Writting to starndard output and standard error 
ls +al 1>standard_output.txt 2>standard_error.txt
# if the command "ls +al" fails, it will go to "2>",
# else it will go to ">1"
# When we run something like 'echo "Hello" > generated.txt' (see examples above)
# the file "generated.txt" is assumed to be the "standard output"

# We send standard output and standard error to the same file
ls +al >standard_output.txt 2>&1
# same as "ls +al >& standard_output.txt"