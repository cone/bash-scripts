#!/bin/zsh

function remove_object {
  object=$1
  if [ -f $object ]; then
    echo "Removing file ${object}..."
    rm $object
  elif [ -d $object ]; then
    echo "Removing directory ${object}..."
    rm -rf $object
  fi
}
