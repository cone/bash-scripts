# Bash Scripting

## Shell Types

There are several like bash, ksh, zsh, etc.

## Shebang

We use it to specify the shell we will use to run the script.

e.g. `#! /bin/zsh`

## Running a script file

If the file has no execution permissions, we can run it by explicitly calling the shell:

```
zsh test.sh
```

## Running an executable script file

We just reference the file, e.g. `./test.sh `.

## Shell Features

### See who has logged in

We can use the `who` command to see the history of who has logged into the computer:

```
> who
myuser  console      Sep 28 09:54
myuser  ttys000      Oct 26 12:24
myuser  ttys001      Oct  3 17:49
```

## Variables

They are created like `varname="value"`. If we add a space after the variable name then it won't be recognized as a variable e.g. `varname = "value"` is wrong.

## Exit status

By convention an exit status of `0` means success, and non-zero return status means failure.

In order to print the exit status of the last executed command we use `$?`. For instance:

```
true
echo $? # echoes 0
false
echo $? # echoes 1
```

## IFS

This variable indicates how the words are separated on the command line. The IFS variable is, normally or by default, a white space (' '). The IFS variable is used as a word separator (token) for the for command.

## Debugging scripts

There are three ways to debug the scripts.

The first one is running the script with the "-x" flag like: `zsh -x ./test.sh`. That will run the script showing the result of each line, one by one.

The second one is by adding the "-x" falg to the script header located at the top of the script file, like: `#!/bin/zsh -x`.

The third option is to enclose the part of the script we want to debug between the `set -x` and `set +x` commands. For instance:

```bash
# Debugging starts here
set -x

myvar="Hello"

if [ "$myvar"=="Hello" ]; then
  echo "The variable is 'Hello'"
else
  echo "Nope"
fi

# Debugging ends here
set +x

# This won't be includded in the debugging
echo "The script has finished.."
```
