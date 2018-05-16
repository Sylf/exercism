#!/usr/bin/env bash
if [ ${1} == 'total' ];
then
    bc <<< '2^65-1'
    exit
fi

if [ ${1} -lt 1 ] || [ ${1} -gt 64 ];
then
    echo 'Error: invalid input'
    exit 1
fi
bc <<< "2^(${1}-1)"
