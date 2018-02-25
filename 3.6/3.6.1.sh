#!/bin/bash

export TIMEFORMAT=%R
echo -e "\tkomult\tpmult"
for i in $(seq $1 $2 $3); do
    echo -ne "$i\t"
    echo -n $(time ( sml 3.6/3.6.1a.sml komult $i >/dev/null ) 2>&1)
    echo -ne "\t"
    echo -n $(time ( sml 3.6/3.6.1a.sml pmult  $i >/dev/null ) 2>&1)
    echo
done

