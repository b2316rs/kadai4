#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "このスクリプトは2つの自然数を引数として必要とします"
    exit 1
fi

for num in $1 $2; do
    if ! [[ "$num" =~ ^[1-9][0-9]*$ ]]; then
        echo "引数は自然数である必要があります: $num"
        exit 1
    fi
done


gcd() {
    if [ $2 -eq 0 ]; then
        echo $1
    else
        gcd $2 $(($1 % $2))
    fi
}

gcd $1 $2

