#!/bin/bash
set -e

fbtargets='
linux-x86
linux-x86_64
linux-arm
linux-aarch64
freebsd-x86
freebsd-x86_64
freebsd-arm
freebsd-aarch64
openbsd-x86
openbsd-x86_64
openbsd-arm
openbsd-aarch64
netbsd-x86
netbsd-x86_64
netbsd-arm
netbsd-aarch64
darwin-x86
darwin-x86_64
win32
win64
cygwin-x86
cygwin-x86_64
dos
'

lib/run-tests.sh tests "$fbtargets"
