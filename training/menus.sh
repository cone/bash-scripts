#!/bin/zsh

# Print options and store result of selection
# Exit menu with "break"
select number in one two three;
do
	echo "You selected $number"
	break;
done

# Example: Use a case statement
select city in NY Sidney Beiging Exit;
do
	case $city in
  NY)
    echo "Let's get some NY pizza!";;
  Sidney)
    echo "Never been there";;
  Beiging)
    echo "Maybe for next vacation?";;
  Exit)
    break;;
  *)
    echo "Error, please select an existing option";;
  esac
done

# Example: Print all files in current dir and prompt to select one
# "$REPLY" contains the number of the selected option
select filename in *;
do
	echo "You selected $filename ($REPLY)"
	break;
done
