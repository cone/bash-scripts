#!/bin/zsh

# Grep is used to search for text. It is used like this:
# grep <text_to_search_for> <file_name>
# If we use the "-i" option, we search in case insensitive mode.
# If we use the "-n" option, it shows us the line number
grep -in shell README.md
# options like "-i -n" can be grouped as "-in"

# If we use the "-c" option, we get the number of ocurrences of the word
grep -ci shell README.md
# => 3

# If we use the "-v" option, we get the number of lines that
# don't contain the specified word
grep -vci shell README.md
# => 102
