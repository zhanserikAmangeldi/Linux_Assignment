#! usr/bin/bash

new_name=$1

sed -i -E "s/job "[^$]*" /job \"$new_name\" /g" example.nomad
