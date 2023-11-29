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

## Parameter expansion

### Conditional parameter expansion

When expanding parameters using `${}`, we can pass wome extra flags to change the behavior in some circunstances. For instance, if the variable that we are trying to expand is unset or empty.

| Parameter expansion | unset var | var="" | var="gnu" |
|---------------------|-----------|--------|-----------|
| ${var-default} | default | - | gnu |
| ${var:-default} | default | default | gnu |
| ${var+alternate} | - | alternate | alternate |
| ${var:+alternate} | - | - | alternate |
| ${var?error} | error | - | gnu |
| ${var:?error} | error | error | gnu |

If I use `=` instead of `-` (when applicable, e.g `${var:=default}`), aside of the default value setting, it will store the value in the variable so, when accessing `$var` the value should be stored there.

### Substring parameter expansion

| Parameter expansion | var="open source"|
|---------------------|------------------|
| ${var:offset}       | ${var:5} => "source" |
| ${var:offset:length} | ${var:5:4} => "sour" |
| ${var#pattern} | ${var#*o} => "pen source" |
| ${var##pattern} | ${var##*o} => "urce" |
| ${var%pattern} | ${var%e*} => "open sourc" |
| ${var%%pattern} | ${var%%e*} => "op" |

### Substitution in parameter expansion

| Parameter expansion | var="free and open"|
|---------------------|--------------------|
| ${var/pattern/string} | ${var/[[:blank:]]/_} => "free_and open"; ${var/e?/i} => "fri and open" |
| ${var//pattern/string} | ${var//[[:blank:]]/_} => "free_and_open"; ${var//e?/i} => "fri and opi" |
| ${var/#pattern/string} | ${var/#f/F} => "Free and open" |
| ${var/%pattern/string} | ${var/%n/N} => "free and opeN" |

### Indirection, Listing and Length

| Parameter expansion | param="parade"; parade="long"; name=(gnu not linux) |
|---------------------|---------------------------------------------------|
| ${!param} | long (indirect expansion, "param" holds the value "parade", so we expand the content of the variable called "parade")|
| \$\{\!pa*} or "${!pa@}" | parade param (list names prefixing pa*)|
| \$\{\!name[*]} or "${!name[@]}" | 0 1 2 (list keys in array)|
| ${#param} | 6 (length)|
