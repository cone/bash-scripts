#!/bin/zsh

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