#!/bin/bash
for((i=1; i<=32;i=i+1))
do
  OMP_NUM_THREADS=$i
  export OMP_NUM_THREADS
  ./$1 7000 >> datosPC7000
done

for((i=1; i<=32;i=i+1))
do
  OMP_NUM_THREADS=$i
  export OMP_NUM_THREADS
  ./$1 20000 >> datosPC20000
done
