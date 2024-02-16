#!/bin/zsh

# (…) PARENTHESES ------------------------------------------------------

# They indicate a subshell. What's inside them isn't an expression like in many other languages.
# It's a list of commands (just like outside parentheses).
# These commands are executed in a separate subprocess, so any redirection, assignment, etc.
# performed inside the parentheses has no effect outside the parentheses.
pwd
(cd ..)
pwd # no change in the current directory because "cd .." ran in a subshell
# we can feed the result of the sub-shell to other commands:
(echo a; echo b;) | sort
# => a
# => b

# we can use them to build arrays
month=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")

# $(…) DOLAR SIGN PARENTHESES ------------------------------------------

# With a leading dollar sign, $(…) is a command substitution: there is a command inside the parentheses,
# and the output from the command is used as part of the command line.
cat $(pwd)/README.md

# ((…)) DOUBLE PARENTHESES ---------------------------------------------

# They are used for arithmetic operations
((sum = 5 + 3))
echo $sum

# and evaluation of expressions.
# * notice that the assignments have spaces vs the normal way: a=5
((a = 5))
((b = 10))
((c = 15))
 
if (( a < b && b < c )); then
  echo "b is between a and c."
else
  echo "b is not between a and c."
fi

# and, we can use them in loops too
((sum = 0))
((i = 1))
 
while ((i <= 10)); do
  ((sum += i))
  ((i++))
done
 
echo $sum

# also, nested expressions using single patentheses
((result = 5 * (3 + 2) - (10 / 2)))
echo $result

# <, > ANGLE PARENTHESES -------------------------------------------

# <(...) This is known as a process substitution. It's a lot like a pipe,
# except you can use it anywhere a command expects a file argument.
# And you can use multiple at once!
sort -nr -k 5 <( ls -l /bin ) <( ls -l /usr/bin ) <( ls -l /sbin )
# Behind the scenes, the <( stuff ) actually outputs the name of a 
# temporary file (unnamed pipe file) for the sort command to use.
echo <( ls -l /bin ) # returns something like '/dev/fd/11' which is the temporary file
# It works the other way around too ">(command)"
ls -l /bin > >(sort -nr -k 5)
# "<(...)" is knon as input redirection. ">(...)" is known as output redirection and,
# in that case we usually use a ">" simbol before it, like: command > >(...)

# Write to a file replacing all content if the file already exists
echo "Hello" > test_file.txt
# Append text to a file
echo "world" >> test_file.txt

# Heredocs, which are miltiline comments we show in the console
cat << mycustomname
Hello, this is my
comment that will be shown
in the output
mycustomname


# {…} CURLY BRACKETS ---------------------------------------------------

# We can use them to group the output from several commands into one big blob.
# Similar to using single parenthesis "()" but sharing the current environment.
# Surrownding spaces and semicolons are mandatory.
# For instance, in the following example, without the curly brackets, only the
# word "World!" would be saved to the file
{ echo "Hello "; echo "World!"; } > file.txt # Saves "Hello /nWorld!"

# We use them for expansion, so we can use them to build arrays:
echo {0..10} # prints numbers from 1 to 10, we can reverse it with {10..0}
echo {10..0..2} # in reverse order and step 2, wich will print even numbers
                # and zero (run with zsh)
echo {a..z}{a..z} # prints out all the two letter combinations of the alphabet,
                  # from aa to zz.
echo h{a,e,i,o,u}p
# => hap hep hip hop hup
echo "I am "{cool,great,awesome}
# => I am cool I am great I am awesome
mv friends.txt{,.bak}
# => braces are expanded first, so the command is
# `mv friends.txt friends.txt.bak`

# ${…} DOLAR SIGN CURLY BRACKETS -----------------------------------------

# With a leading dollar sign, ${…} is a "parameter expansion" which means that
# it takes the variable or expression within the braces and expands it
# to whatever it represents. So, we can:
echo ${month[0]} # Read array values
a="Too longgg"; echo ${a%gg} # Modify values: chops off the last two gs and 
                             # prints “Too long“.

# […] SQUARE BRACKETS ---------------------------------------------------

# This is an alternate version of the built-in test. The commands inside are
# run and checked for "truthiness." Strings of zero length are false.
# Strings of length one or more (even if those characters are whitespace)
# are true.

# Checks if a file exists
if [ -f file.txt ]
then
    echo "File exists!"
else
    echo "File does not exist"
fi

# [[…]] SQUARE BRACKETS ---------------------------------------------------

# True/false testing. Additionally, double square brackets support extended
# regular expression matching. Use quotes around the second argument to force
# a raw match instead of a regex match.

pie=good
[[ $pie =~ d ]]; echo $?
# => 0, it matches the regex!

[[ $pie =~ [aeiou]d ]]; echo $?
# => 0, still matches

[[ $pie =~ [aei]d ]]; echo $?
# => 1, no match

[[ $pie =~ "[aeiou]d" ]]; echo $?
# => 1, no match because there's no literal '[aeoiu]d' inside the the 
# word "good"

# Notes ------------------------------------------------------------------

# More info here: https://dev.to/rpalo/bash-brackets-quick-reference-4eh6



