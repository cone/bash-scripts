#!/bin/zsh

# Write to file replacing all text
echo "Some text" > myfile
# this appends to any existing content
echom "more text" >> myfile

# Check if a file exists
if [ -f "myfile" ]; then
  echo "myfile file exists!"
else
  echo "myfile file doesn't exist"
fi

# Example of writting to file if it exists
if [ -f "myfile" ]; then
  echo "Input the text that you want to append"
  read userInput
  echo "$userInput" >> myfile
else
  echo "myfile file doesn't exist"
fi

# Example of reading all lines of a file
# IFS is set to blank space, the same as IFS=""
# Also works if I remove IFS altogether
while IFS= read -r line
do
  echo "$line"
done < README.md
