#! /bin/bash

if ! [[ -x vunzip ]]; then
    echo "vunzip executable does not exist"
    exit 1
fi

../tester/run-tests.sh $*


