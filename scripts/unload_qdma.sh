#!/bin/sh

dmactl qdma0 q stop idx 0 dir c2h
dmactl qdma0 q stop idx 0 dir h2c
dmactl qdma0 q del idx 0 dir c2h
dmactl qdma0 q del idx 0 dir h2c
rmmod /work/qdma/build/qdma.ko
