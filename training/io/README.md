## Output

If not specified fd 1 (STDOUT) is assumed when redirecting output.

We can redirect fd 1 (STDOUT), fd 2 (STDERR), etc. e.g. `2>file` to redirect fd 2 (STDERR) to a file.

We can even do things like redirecting fd 2 (STDERR) to fd 1 (STDOUT) by specifying the fd number and prepending `&` e.g. `2>&1`.