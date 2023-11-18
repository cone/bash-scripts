#!/bin/zsh

# Declaration
arr=('one' 'two' 'three')
# declare an empty array
emptyarr=()

# Append items
emptyarr=(${emptyarr[@]} "New")
# append values stored in variables (we need to expand the values)
temp="Item"
emptyarr=(${emptyarr[@]} ${temp})

# Access of a value at a specific index
echo ${arr[1]}
# => one

# Print all values
echo ${arr[@]}
# => one two three

# Iterate all values
for value in "${arr[@]}"
do
  echo "The value is: $value"
done

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
