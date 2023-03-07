#!/bin/bash

attacks=(GA LF)
methods=(fedavg krum median PSEFL Pt-PSEFL trimmedmean)

function make_dir_batch () {
    base_dir=$1
  if [ ! -d "${base_dir}" ]; then
      mkdir "${base_dir}"
  fi
   for attack in "${attacks[@]}"; do
      if [ ! -d "$base_dir""/""$attack" ]; then
            mkdir "$base_dir""/""$attack"
      fi
      for method in "${methods[@]}"; do
        if [ ! -d "${base_dir}""/""$attack""/""$method" ]; then
            mkdir "${base_dir}""/""$attack""/""$method"
        fi
      done
   done
}

if [[ $# = 2 && $1 = md ]]; then
    make_dir_batch "$2"
fi
