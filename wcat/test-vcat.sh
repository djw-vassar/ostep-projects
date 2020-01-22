#! /bin/bash

if ! [[ -x vcat ]]; then
    echo "vcat executable does not exist"
    exit 1
fi

../tester/run-tests.sh $*


