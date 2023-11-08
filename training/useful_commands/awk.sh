#!/bin/zsh

# Display all the content of a file
awk '{print}' README.md

# Display all the linex that contain the word 'shell'
awk '/shell/ {print}' README.md
# Display the second word of each line that contains the word 'shell'
awk '/shell/ {print $2}' README.md
# Same example but printing the second and third words
awk '/shell/ {print $2,$3}' README.md
