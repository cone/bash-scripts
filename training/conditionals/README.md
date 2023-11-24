## Tests

### Single square brackets
Evaluate conditional expression with test builtin: 

```
[ <expression> ]
```

### Double square brackets

If we evaluate a conditional expression like:

```
[[ <expression> ]]
```

then, `word splitting` is not performed. Also, the righthand of a string comparison (`==`, `!=`) is treated as a `pattern` when **not quoted**, and as a `string` when **quoted**.

Other checks we can do with double square brackets:

| expression evaluation | meaning |
|-----------------------|---------|
| [[ -n string ]] | **string** is not empty |
| [[ -n string ]] | **string** is empty |
| [[ string1 == string2 ]] | **string1** and **string2** are the same |
| [[ string1 != string2 ]] | **string1** and **string2** are **not** the same |
| [[ string =~ regex ]] | **string** matches regular expression |
| [[ -e file ]] | **file** exists |
| [[ -f file ]] | **file** is a regular file |
| [[ -d file ]] | **file** is a directory |
| [[ -t fd ]] | **fd** is open and refers to a terminal |
| [[ -z string ]] | True if the **string** is null (an empty string) |
