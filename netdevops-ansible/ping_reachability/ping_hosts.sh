#!/bin/bash

# define ping host list
hosts=(
  10.2.60.50
  10.2.60.51
  10.2.60.52
  10.2.60.53
  10.2.60.54
  10.2.60.55
  10.2.60.64
  10.2.60.67
  10.2.60.77
  10.2.60.78
  10.2.60.79
  10.2.60.80
  10.2.60.81
  10.2.60.82
  10.2.60.83
  10.2.60.84
  10.2.60.85
  10.2.60.87
  10.2.60.88
  10.2.60.89
)

# sorting host addresses
sorted_hosts=($(printf '%s\n' "${hosts[@]}" | sort -V))

# loop ping host addresses
for host in "${sorted_hosts[@]}"
do
    ping -c 4 $host # -c 4ping 4 
done
