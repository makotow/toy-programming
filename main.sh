#!/bin/sh
set -e
trap 'echo NG' ERR
./sub.sh
echo OK
exit 0

