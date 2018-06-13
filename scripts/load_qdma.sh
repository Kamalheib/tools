#!/bin/sh

insmod /work/qdma/build/qdma.ko
dmactl qdma0 q add idx 0 dir h2c
dmactl qdma0 q add idx 0 dir c2h
dmactl qdma0 q start idx 0 dir h2c
dmactl qdma0 q start idx 0 dir c2h
