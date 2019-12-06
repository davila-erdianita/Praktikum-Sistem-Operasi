#!/bin/bash
echo "masukkan batas bawah : ";
read a
echo "masukkan batas atas : ";
read b
echo "masukkan modulus : ";
read c
f=0
echo "
"
for ((d=$a; d<=$b; d=d+1))
do
let e=$a%$c
if [ $e -ne 0 ]
then
echo "$a"
let a=$a+1
else
echo 'Eureka!'
let a=$a+1
let f=$f+1
fi
done
h=1
while [ $f -gt 1 ]
do
h=$((h*f))
f=$((f-1))
done
echo "$h"

