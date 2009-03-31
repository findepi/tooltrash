#!/bin/bash

if test "`echo $1 | wc -l `" -ne 1; then
    echo "Wrong parameter" >&2
    exit 1
fi
if test "`echo $1 | grep : `" = ""; then
    file="$1"
else
    file="`echo $1 | cut -d: -f1`"
    line="`echo $1 | cut -d: -f2`"
fi
shift 1

prog="$1"
shift

case "$prog" in
    VIm)	$prog "$file" "+$line" "$@";;
    kwrite)	$prog "$file" --line $[line - 1] "$@";;
    *)	vim "$file" "+$line";;
esac
