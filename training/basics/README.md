# Shell Features

There are several like bash, ksh, zsh, etc. We can know which shell we are running by typing:

```
> echo $SHELL
/bin/zsh
```

## Pipes

We can use the `who` command to see the history of who has logged into the computer:

```
> who
myuser  console      Sep 28 09:54
myuser  ttys000      Oct 26 12:24
myuser  ttys001      Oct  3 17:49
```

If we want to know how many lines that output has, we can pass it to the word count command (wc) using a pipe:

```
> who | wc -l
3
```

The pipe (|) connects both commands "who" and "wc".

## Wildcards

Wildcards are a shorthand for sets of files with similar names. They are "expanded" by the shell into the actual set of filenames  they match.

For instance, in:

```
ls a*
```

The `*a` wildcard expands to `antiques anne amigos` (supposing those three are existing directories). That means that the actual command passed to `ls` by the shell is:

```
ls antiques anne amigos
```

That means that every command regardless of its origin, works with wildcards and other shell features.

There are two characters that wildcards will never match:
- A leading point (e.g. ".bashrc")
- The directory slash (/)

If we need to use them, they must be given literally. Some examples:

- `ls .pro*` to match `.profile`
- `/etc/*conf` to match all the files ending in `conf` inside the `/etc` directory

|   Wildcard   |      Meaning      |
|--------------|-------------------|
|      *       | Zero or more consecutive characters |
|      ?       | Any single character |
|    [set]     | Any single character in the give set, most commonly a sequence of characters, like [aeiouAEIOU] for all vowels, or a range with a dash like [A-Z] for all capital letters |
|    [^set]    | Any single character NOT in the given set, such as [^0-9] to mean any nondigit |
|    [!set]    | same as [^set] |
| [[:class:]]  | Matches according to these POSIX classes: alnum, alpha, ascii, blank, cntrl, digit, graph, lower, print, punct, space |

## Built in commands

We can know if a command is part of the shell or not by running the command "type":

```
> type cd
cd is a shell builtin

> type who
/usr/bin/who
```

## Exit status

By convention an exit status of `0` means success, and non-zero return status means failure.

In order to print the exit status of the last executed command we use `$?`. For instance:

```
true
echo $? # echoes 0
false
echo $? # echoes 1
```
