#!/bin/bash

work_dir=$1
localenv_dir=$(dirname $0) 

if [ $# -gt 1 ]; then
    echo "$(basename $0): Too mary arguments"
    exit 1
fi

if [ -z "$work_dir" ]; then
    work_dir=$HOME
fi

if [ ! -d "$work_dir" ]; then
    echo "$(basename $0): No such directory: $1"
    exit 1
fi
