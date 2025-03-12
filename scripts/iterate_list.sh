#!/bin/bash

_nc="\e[0m="
_col="\e[34m"

query_value()
{
# echo $1 "$(shm $1?)"
 echo -e $_col $1 $_nc "$(echo $1)"
}


## list
list="\
AA \
BB \
CC \
DD \
"

for i in $list; do
  query_value $i
done