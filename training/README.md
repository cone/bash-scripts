# Bash Scripting

## Shell types

There are several like bash, ksh, zsh, etc.

## Shebang

We use it to specify the shell we will use to run the script.

e.g. `#! /bin/zsh`

## Running a script file

If the file has no execution permissions, we can run it by explicitly calling the shell:

```
zsh test.sh
```

## Execution permissions

In order to give the current user read, write and execution permissions, we run the folowing:

```
chmod 744 test.sh
```

7 means read, write and execution. 4 means only read and execution.

Number	Permission Type	Symbol

```
0	
No Permission	
â

1	
Execute	
âx

2	
Write	
-w-

3	
Execute + Write	
-wx

4	
Read	
râ

5	
Read + Execute	
r-x

6	
Read +Write	
rw-

7	
Read + Write +Execute	
rwx
```

The first space (7) is for the current user. The seconds space (4) is for the users of the group. The third space (second 4) is for the rest of the users.

We can se the given permissions by running `ls -l`. e.g:

```
-rwxr--r--  1 carlosgutierrez  staff   25 Jul  9 13:59 test.sh
```

## Running an executable script file

We just reference the file, e.g. `./test.sh `.

## Variables

They are created like `varname="value"`. If we add a space after the variable name then it won't be recognized as a variable e.g. `varname = "value"` is wrong.
