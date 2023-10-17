#!/bin/zsh

# fswatch is a file change monitor that receives notifications when the
# contents of the specified files or directories are modified.
# Docs here: https://emcrisostomo.github.io/fswatch/doc/

# It can be installed with the following command:
# brew install fswatch

# The default mode will return the path of the modified object
fswatch path/to/my/dir
# => path/to/my/file.text

# If we use the "-x" (--event-flags) option we will be able to see
# details on the kind of change event
fswatch -xr path/to/my/dir
# => path/to/my/file.text AttributeModified IsFile
# => path/to/my/file.text AttributeModified IsFile Updated

# Look for change events in the current directory.
# Use -o (or --one-per-batch) to use in batch mode,
# which performs a bulk action on all the observed file system objects.
# It will then respond sith the number of change events registered
fswatch -o .
# => 1

# we can use the "-l" option to make fswatch report only after
# a specific number of secods.
fswatch -o -l 5 path/to/my/dir

# Example: reacting to changes inside a while loop
fswatch -o -l 5 . | while read num;
do
  echo "$num changes registered"
done
