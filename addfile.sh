#!/bin/bash
#Author: Mengzhuo G

for i in {1..50}
do
  RAN1=`tr -dc a-z </dev/urandom | head -c5`
  RAN2=`tr -dc a-z </dev/urandom | head -c6`
  mkdir $RAN1
  dd if=/dev/zero of=$RAN1/$RAN2 count=1024 bs=1024
done
