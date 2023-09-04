#!/bin/zsh

# Functions
function sayHello {
  echo "Say $arg1"
}
# Or
sayHello2() {
  echo "Say $arg1 2"
}

sayHello
sayHello2
