#!/bin/zsh

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
