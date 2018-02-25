#!/bin/bash

export TIMEFORMAT=%R

function run {
    mult=$1; shift
    echo $mult

    echo -ne "\t"
    for j in $(seq $4 $5 $6); do
        echo -ne "$j\t"
    done
    echo

    for i in $(seq $1 $2 $3); do
        echo -ne "$i\t"
        for j in $(seq $4 $5 $6); do
            echo -ne "$(time ( sml 3.6/3.6.2.sml $mult $i $j >/dev/null ) 2>&1)\t"
        done
        echo
    done
    echo
}

run komult $1 $2 $3 $4 $5 $6
run pmult  $1 $2 $3 $4 $5 $6

