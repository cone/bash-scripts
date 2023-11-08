#!/bin/zsh

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
