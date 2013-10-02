#!/bin/sh

process=$1
interval=$2

while true 
do
    date '+%Y/%m/%d %T'
    ps -ef | grep ${process} | grep -v grep | wc -l
    sleep ${interval}
done