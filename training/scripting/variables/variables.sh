#!/bin/zsh

# Simple variables (automatic type detection)
myvar="Hello"
myvar2=10
# I reference it by prepending "$"
echo $myvar

# String interpolation
var1='Hello'
var2='world!'
# we need double quotes in order to interpolate the strings
var3="${var1} ${var2}"
echo $var3
# => Hello world!
# we can combine numbers and strings
var4=10
echo "${var1} ${var2}"
# Hello 10
# This also works:
echo "$var1 $var2"
# => Hello world!

# see all declared variables
declare -p

# declare a variable
declare myvar=10
# declare a "read only" variable
declare -r myreadonlyvar=11

# hex to decimal
hexnum=FFF
echo "obase=10; ibase=16; $hexnum" | bc
# => 4095

# remove variable
unset myvar
