#!/bin/bash

command="sleep 5"


echo "Hey"

# create a child sh object running 
# sh -c "$command"

# create a child object for command
# $command
# sh -c "exec $command"

# run in background
$command &

echo -n ".. Ho "
sleep 0.5
echo -n "Ho "
sleep 0.5
echo "Ho"