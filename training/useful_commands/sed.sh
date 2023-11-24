#!/bin/zsh

# The sed command is useful to replace text
# > sed 's<separator><replaced-text><separator><replacing-text><separator>'

# We can use any symbol as separator, we just need to add it before the initial "s"
# For instance, we can use "|":
# > sed 's|<replaced-text>|<replacing-text>|'
# Whowever the most common character is "/"

# Replace 'shell' word with 'SHELL' using 's/'(substitute).
cat README.md | sed 's/shell/SHELL/'
# Without using the pipe convention.
sed 's/shell/SHELL/' README.md

# Replace letter 's' with 'S' but, replacing all matches,
# not just the first match of each line.
sed 's/s/S/g' README.md

# Replace the text in-place (in the same file we are reading)
sed -i '' 's/text/Work/' test.txt
# If we specify an extension, a backup file will be generated
sed -i '.bak' 's/text/Work/' test.txt
