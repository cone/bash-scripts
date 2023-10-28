#!/bin/zsh

# Built-in variables
# >>>>>>> HOME variable
echo $HOME
# => path/to/my/home
# I can use it directly in a command:
ls $HOME
# >>>>>>> USER variable
echo $USER
# => myusername
# >>>>>>> HOST-NAME variable
echo $HOST-NAME
# => myusername.local-NAME

# Avoid the expansion of a variable (escape the $ sign)
echo "\$HOME"
# => $HOME
