#!/bin/sh

# Bibliographic records:
#
# Basic shell script example with explanation of how to set it up: 
# https://www.shellscript.sh/first.html
#
# About "uname" command: 
# https://en.wikipedia.org/wiki/Uname
#
# About "tr" command: 
# https://www.geeksforgeeks.org/tr-command-in-unix-linux-with-examples/
#
# About "head" command: 
# https://www.geeksforgeeks.org/tr-command-in-unix-linux-with-examples/
#
# About "wc" command: 
# https://www.geeksforgeeks.org/head-command-linux-examples/
#
# About "uname" command: 
# https://www.geeksforgeeks.org/wc-command-linux-examples/
#
# About "-ne" and other shell script test conditions: 
# https://www.shellscript.sh/quickref.html

output=$(uname -a | tr -d ' \n\r\t ' | head -c1 | wc -c)

if [ "$output" -ne "0" ]
then
  echo '"uname" command has output'
else
  echo '"uname" command has no output'
fi

# Other links:
# https://gist.github.com/jesugmz/3fda0fc7c1006cedfe039ff1459c3174