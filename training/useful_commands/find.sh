#!/bin/zsh

# The find command is useful to find different types of objects
# like files (default)
find . -name myfile
# same as
find . -name myfile -type f

# or we can also find directories
find . -name mydir -type d
