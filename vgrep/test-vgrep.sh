#! /bin/bash

if ! [[ -x vgrep ]]; then
    echo "vgrep executable does not exist"
    exit 1
fi

../tester/run-tests.sh $*



