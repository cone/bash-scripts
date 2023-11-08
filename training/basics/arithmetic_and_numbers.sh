#!/bin/zsh

n1=10
n2=20

echo $(( n1 + n2))
echo $(( n2 - n1))
echo $(( n1 * n2))
echo $(( n2 / n1))
echo $(( n2 % n1))

# Using a different syntax
echo $( expr $n1 + $n2 )

# hex to decimal
hexnum=FFF
echo "obase=10; ibase=16; $hexnum" | bc
# => 4095
