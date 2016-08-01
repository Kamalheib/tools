#!/bin/sh

modprobe -rv mlx4_en mlx4_ib mlx4_core
sleep 3
modprobe -v mlx4_core && modprobe -v mlx4_en && modprobe -v mlx4_ib
