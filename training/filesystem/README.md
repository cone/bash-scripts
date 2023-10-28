## System directories

The system directories contain operating sysytem files, applications, documentation, etc. Just about everything except personal user files, which typically live in the user's home directory.

The system directory path consist of three parts:
- Scope
- Category
- Application

For instance, if we take the path `/usr/local/share/zsh`, `/usr/local` would be the "scope". `/share/` would be the "category" and `/zsh` the "application".

## File and Directory protections

### Who has permissions?

- The file **owner**. Typically who created the file or directory. However the ownership can be changed by the super user.
- A predefined **group** of users my have permissions to access a file.
- A file or directory can be opened to **all users**.

### What kind of permisions can be granted?

- Read
- Write (modify)
- Execute

We can see the permissions of a **file** by running:

```
> ls -l README.md
-rw-r--r--  1 myuser  staff  59 Jun  3 10:51 README.md
```

We can see the permissions of a **directory** by running:

```
> ls -ld algorithms
drwxr-xr-x  11 myuser  staff  352 Jun  3 10:54 algorithms
```

In the output of those commands, the permissions are the 10 leftmost characters where `r` means "read", `w` means "write" and `x` means "execute". The dashes mean that no permission was set for a specific position. For instance:

```
-rwxr-xr-x
```

Here's what each position means:

| Position |    Meaning                                                |
|----------|-----------------------------------------------------------|
|    1     | file type: - (file), d (directory), l (symbolic link), p (named pipe), c (character device), b (block device)                          |
|   2-4    | Read, write and execute permissions for the file's owner  |
|   5-7    | Read, write and execute permissions for the file's group  |
|   8-10   | Read, write and execute permissions for all other users   |

### Assigning permissions

In order to give the current user read, write and execution permissions, we run the following:

```
chmod +x test.sh
```

The only inconvenient is that said command will apply for all users. If we need more controll about who we give permissions to, we can do something like:

```
chmod 744 test.sh
```

The first space (7) is for the current user. The seconds space (4) is for the users of the group. The third space (second 4) is for the rest of the users.

Here's what each number means:

| Number   |   Permission             |   Type	Symbol     |
|----------|--------------------------|--------------------|
|    0     |   No Permission          |        -           |
|    1     |   Execute                |        -x          |
|    2     |   Write                  |        -w-         |
|    3     |   Execute + Write        |        -wx         |
|    4     |   Read                   |        r-          |
|    5     |   Read + Execute         |        r-x         |
|    6     |   Read + Write           |        rw-         |
|    7     |   Read + Write + Execute |        rwx         |

We can se the given permissions by running `ls -l`. e.g:

```
-rwxr--r--  1 carlosgutierrez  staff   25 Jul  9 13:59 test.sh
```

We can also remove individual permissions. For instance, if we want to remove the ability to write a file, we can do so with:

```
chmod -w test.sh
```
