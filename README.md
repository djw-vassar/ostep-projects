# Intro To Kernel Hacking

To develop a better sense of how an operating system works, this
project will have you working *inside* a real OS kernel. The kernel
we'll be using is a port of the original Unix (version 6), and is
runnable on modern x86 processors. It was developed at MIT and is a
small and relatively understandable OS and thus an excellent focus for
simple projects.

The goal of this project is simple: to add a system call to xv6. Your
system call, **getreadcount()**, simply returns how many times that
the **read()** system call has been called by user processes since the
time that the kernel was booted.

## Your System Call

Your new system call should look have the following return codes and
parameters: 

```c
int getreadcount(void)
```

Your system call returns the value of a counter (perhaps called
**readcount** or something like that) which is incremented every time
any process calls the **read()** system call. That's it!

## The xv6 Source Code

A copy of the xv6 source code has been cloned into the src/
subdirectory.

## Running xv6 with QEMU

To play with xv6, we will use the
[`qemu`](https://www.qemu.org/download/) machine emulation
environment.

To learn more about what emulation is, read [this
page](https://en.wikipedia.org/wiki/Emulator). The short story is that
an emulator is just another computer program, but one that is a
realistic facsimile of a particular computer system. In this case,
we'll use `qemu` to pretend we are running an x86 computer system; on
this pretend x86 system, we'll boot our xv6 kernel.

Now you might ask: why not just run xv6 on a real machine? You could
do that, but it would make running and debugging xv6 slower and more
painful. With a realistic emulator like `qemu`, you can quickly run
your kernel but not have the pain of rebooting the actual system you
are using. Further, if you make a mistake, your entire machine doesn't
lock up, just the emulator, which you can exit or kill. It just makes
your life much better than doing the real thing.

Our lab machines should have `qemu` already installed.  To build and
run xv6 on QEMU, type:

```sh
prompt> cd src/
prompt> make qemu-nox
```

If all has worked well, you'll see something like:

```sh
Booting from Hard Disk..xv6...
cpu1: starting 1
cpu0: starting 0
sb: size 1000 nblocks 941 ninodes 200 nlog 30 logstart 2 inodestart 32 bmap
sta8
init: starting sh
$
```

The `$` is the shell command prompt: who-hoo! 

To quit `qemu`, type `C-a x` (that is, hold down `control` and while
doing so, press `a`, then let go of `control`, then press `x`).

## Background and Tips

This [discussion video](https://www.youtube.com/watch?v=vR6z2QGcoo8)
contains a detailed walk-through of all the things you need to know to
unpack xv6, build it, and modify it to make this project successful.
You might also want to read this [background
section](./background.md).  More information about xv6, including a
very useful book written by the MIT folks who built xv6, is available
[here](https://pdos.csail.mit.edu/6.828/2017/xv6.html).

One good way to start hacking inside a large code base is to find
something similar to what you want to do and to carefully copy/modify
that. Here, you should find some other system call, like **getpid()**
(or any other simple call). Copy it in all the ways you think are
needed, and then modify it to do what you need.

For this project, most of the time will be spent on understanding the
code. There shouldn't be a whole lot of code added.

# Running Tests

Running tests for your system call is easy. Just do the following:

```sh
prompt> ./test-getreadcounts.sh
```

If you implemented things correctly, you should get some notification
that the tests passed. If not ...

The tests assume that xv6 source code is found in the `src/`
subdirectory.  If it's not there, the script will complain.

The test script does a one-time clean build of your xv6 source code
using a newly generated makefile called `Makefile.test`. You can use
this when debugging (assuming you ever make mistakes, that is), e.g.:

```sh
prompt> cd src/
prompt> make -f Makefile.test qemu-nox
```

You can suppress the repeated building of xv6 in the tests with the
`-s` flag. This should make repeated testing faster:

```sh
prompt> ./test-getreadcounts.sh -s
```


