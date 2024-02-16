## Session Portability

We can import elements from the current session directly into a new local or remote session.

### Import into New Local Session

This is how we can import parameters and functions into **root** shell, then run `code and stuff`:

```
sudo bash -c "$(declare -p parameters; declare -f functions) code and stuff"
```

This is how we can import parameters and functions into a **remote** shell, then run `code and stuff`:

```
ssh remote_host "$(declare -p parameters; declare -f functions) code and stuff"
```

The `declare` command can list parameters and functions from the current shell or set parameter attributes.

When sourcing or interpolating bash code, we must be mindful of shell options which affect parsing, such as `extglob`, if the code relies in that syntax.

Example:

```
#!/bin/bash
# Definition of the function
sayHello () {  echo "Hello!"; }

# Use the function locally
sayHello

# Execution of the function on the remote machine.
ssh user@host "$(declare -f sayHello);sayHello"
```
