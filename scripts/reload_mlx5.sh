#!/bin/sh

modprobe -rv mlx5_ib mlx5_core
sleep 3
modprobe -v mlx5_core && modprobe -v mlx5_ib
