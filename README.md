# bash-scripts
Some bash scripts written for testing or for personal use. In order to use them, first you should give them execution permissions with `chmod +x <script_name>.sh` or something like `chmod 744 <script_name>.sh` to have more control over permissions for each user type.

Some scripts need the `MY_SCRIPTS_HOME` variable to exist in order to work as they load other utility scripts that reside in this repository. Said variaable should point to the repository's directory.

## Chrome driver update
Used to update the version of `chromedriver`.

Usage:

```
> ./chrome-driver-update.sh
```

The script will download the available `chromedriver` versions from the Google chrome labs [json feed](https://googlechromelabs.github.io/chrome-for-testing/known-good-versions-with-downloads.json) and prompt the user to select any of the major versions:

```
Which major chromedriver version do you wish to install?
1) 115  2) 116  3) 117  4) 118  5) 119  6) 120  7) 121
?#
```

Then it will install the latest sub-version of the selected major version.

```
118 was selected (4)
Installing version 118.0.5993.70...
```
