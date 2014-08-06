#!/bin/bash

work_dir=$1

# TODO: Check the number of arguments.

if [ ! -d "$work_dir" ]; then
    echo "$(basename $0): No such directory: $1"
    exit 1
fi
