#!/bin/zsh

# Case statement
COUNTRY="Mexico"

case $COUNTRY in

  Mexico)
  echo -n "It's Mexico!"
  ;;

  Cuba)
  echo -n "It's Cuba!"
  ;;

  *)
  echo -n "It's Other!"
  ;;
esac