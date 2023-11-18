## Parameters

When we send parameters to a script, we receive them by their position. For instance, in:

```
> ./myscript.sh one wto three
```
We would get the parameters by their position as: `$1 $2 $3`:

```
echo $1 $2 $3
# => one two three
```

If we get more than 9 parameters, then we need to wrap them with `${}`:

```
echo $1 $2 $3 $4 $5 $6 $7 $8 $9 ${10}
```

If not, we would get the parameter specified by the first digit plus the second digit as text. For instance, in:

```
> ./myscript.sh one wto three four fice six seven eight nine ten
```

This would happen
```
echo $1 $2 $3 $4 $5 $6 $7 $8 $9 $10
# => one wto three four fice six seven eight nine one0
```

## Special prameters

| Symbol | function |
|--------|----------|
| $* | "$*" is equivalent to "$1c$2c…", where c is the first character of the value of the IFS variable. |
| $@ | Expands to the positional parameters, starting from one. "$@" is equivalent to "$1" "$2" … |
| $# | Expands to the number of positional parameters in decimal. |
| $- | Expands to the current option flags as specified upon invocation, by the set builtin command, or those set by the shell itself (such as the -i option). |
| $$ | Expands to the process ID of the shell. In a subshell, it expands to the process ID of the invoking shell, not the subshell. |
| $0 | Expands to the name of the shell or shell script. |
| $! | Expands to the process ID of the job most recently placed into the background. |
| $? | Expands to the exit status of the most recently executed foreground pipeline. |
| $_ | Expands to the last argument of the previous command that you executed in your terminal. |

More info [here](https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html) and [here](https://linuxhint.com/dollar-underscore-bash/).
