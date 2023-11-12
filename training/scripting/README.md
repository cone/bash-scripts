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

$*, $@, $#, $-, $$, $0, $!, $?, $_
