#!/bin/zsh

# single line comment

: '
multi
line
comment'

# If we want to show any comments in the output
# we can use a heredoc delimiter. We can use any name
# for the delimiter
cat << mycustomname
Hello, this is my
comment that will be shown
in the output
mycustomname
