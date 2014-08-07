#!/bin/bash

work_dir=$1

if [ $# -gt 1 ]; then
    echo "$(basename $0): Too mary arguments"
    exit 1
fi

if [ ! -d "$work_dir" ]; then
    echo "$(basename $0): No such directory: $1"
    exit 1
fi
