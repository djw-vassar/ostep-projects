
In this directory, you should write the program `vunzip.c` and compile it into
the binary `vunzip` (e.g., `gcc -o vunzip vunzip.c -Wall -Werror`).

After doing so, you can run the tests from this directory by running the
`test-vunzip.sh` script. If all goes well, you will see:

```sh
prompt> ./test-vunzip.sh
test 1: passed
test 2: passed
test 3: passed
test 4: passed
test 5: passed
test 6: passed
prompt>
```

The `test-vunzip.sh` script is just a wrapper for the `run-tests.sh` script in
the `tester` directory of this repository. This program has a few options; see
the relevant
README
for details.
