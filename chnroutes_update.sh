#!/bin/bash

wget http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest
cat delegated-apnic-latest | grep "CN|ipv4\|HK|ipv4" | awk -F "|" '{a = and(0xffffffff, compl($5-1));printf("add %s mask %d.%d.%d.%d default METRIC default IF default\r\n", $4, rshift(and(0xff000000, a), 24), rshift(and(0x00ff0000, a), 16), rshift(and(0x0000ff00, a), 8), rshift(and(0x000000ff, a), 0))}' > addchnroutes.txt
cat delegated-apnic-latest | grep "CN|ipv4\|HK|ipv4" | awk -F "|" '{a = and(0xffffffff, compl($5-1));printf("delete %s mask %d.%d.%d.%d default METRIC default IF default\r\n", $4, rshift(and(0xff000000, a), 24), rshift(and(0x00ff0000, a), 16), rshift(and(0x0000ff00, a), 8), rshift(and(0x000000ff, a), 0))}' > delchnroutes.txt
