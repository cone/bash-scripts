#!/bin/zsh

# Declaration
arr=('one' 'two' 'three')

# Access of a value at a specific index
echo ${arr[1]}
# => one

# Access all values
echo ${arr[@]}
# => one two three

# Get array length
echo ${#arr}

# Remove an item of the array by index
unset "arr[2]"
echo ${arr[@]}
# => one three

# Add an element
arr[3]='four'
echo ${arr[@]}
# => one three four
