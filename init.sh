#!/bin/bash

work_dir=$1
localenv_dir=$(dirname $0) 
mapping_path=${localenv_dir}/mapping

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

for line in $(cat $mapping_path)
do
    source_path=$(echo $line | awk -F ':' '{print $1}')
    target_path=$(echo $line | awk -F ':' '{print $2}')

    # TODO: Show error messages easy to understand.
    link="ln -s $localenv_dir/$source_path $work_dir/$target_path"
    echo $link
    $link
done
