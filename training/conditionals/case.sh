#!/bin/zsh

# Case statement
COUNTRY="Mexico"

case $COUNTRY in

  Mexico | MX) # we can use "or"(|)
  echo -n "It's Mexico!"
  ;;

  Cuba)
  echo -n "It's Cuba!"
  ;;

  O*) # we can use a wildcard
  echo -n "It's a country that starts with 'o'!"
  ;;

  *)
  echo -n "It's Other!"
  ;;
esac
