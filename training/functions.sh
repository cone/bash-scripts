#!/bin/zsh

# Functions
function sayHello {
  echo "Say: $1"
}
# Or
sayHello2() {
  echo $1 $2
}

sayHello 'Hello world'
sayHello2 Hello world!

# Scopes
# It seems zsh considers the variable global even if declare from function.
# If we need a local variable, we should use teh reserved word "local"
function localScope {
  global='world'
  local localvar='Bye'
}

global='hello'
localvar='Hi'
echo $global
echo $localvar

localScope
echo $global
echo $localvar
# => hello
# => Hi
# => world
# => Hi

