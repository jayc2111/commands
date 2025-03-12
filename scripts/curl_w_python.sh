#!/bin/bash

URL=https://....


## FUNCTIONS ###########
getTestResult() {
    echo -n "$1    "

    output=$(curl -s $URL/$1)
    python -c "$pyscript" "$output"
}


## python script function
pyscript=$(cat <<'EOF'
import sys, json
try:
    data=json.loads(sys.argv[1])
    print(data)
except:
    print("----ERR ")
print("#################")
EOF
)


## MAIN ###########

while read p; do
    getTestResult $p
done <input.txt

exit 0

