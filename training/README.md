# Bash Scripting

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

## Variables

They are created like `varname="value"`. If we add a space after the variable name then it won't be recognized as a variable e.g. `varname = "value"` is wrong.

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
