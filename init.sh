#!/bin/bash

main() {
    script_name=$(basename $0)
    dotfiles_dir=$(abspath $(dirname $0))

    if [ $# -gt 1 ]; then
        echo "${script_name}: Too mary arguments"
        exit 1
    fi

    dest_dir=$(abspath $(verify_dest $1))
    if [ ! -d "$dest_dir" ]; then
        echo "${script_name}: No such directory: $dest_dir"
        exit 1
    fi

    mapping_path=${dotfiles_dir}/mapping
    if [ ! -f "$mapping_path" ]; then
        echo "${script_name}: The mapping file doesn't exist."
        exit 1
    fi

    create_link ${mapping_path} ${dotfiles_dir} ${dest_dir}
}

abspath() {
    dir=$(cd $(dirname $1); pwd)

    name=$(basename $1)
    if [ "${name}" = "." ]; then
        echo "${dir%/}"
        return
    fi

    echo "${dir%/}/${name}"
    return
}

verify_dest() {
    if [ -z "$1" ]; then
        echo $HOME
    fi

    echo $1
}

create_link() {
    mapping_path=$1
    source_dir=$2
    dest_dir=$3

    for line in $(cat $mapping_path)
    do
        source_path=$(echo ${line} | awk -F ':' '{print $1}')
        target_path=$(echo ${line} | awk -F ':' '{print $2}')

        abs_source_path=${dotfiles_dir}/${source_path}
        abs_target_path=${dest_dir}/${target_path}

        mkdir -p $(dirname ${abs_target_path})

        if [ -d "${abs_target_path}" ]; then
            echo "Fail: ${abs_source_path} => ${abs_target_path}"
            continue
        else
            ln -s "${abs_source_path}" "${abs_target_path}" 2>/dev/null
        fi

        if [ $? -eq 0 ]; then
            echo "Create: ${abs_source_path} => ${abs_target_path}"
        else
            echo "Fail: ${abs_source_path} => ${abs_target_path}"
        fi
    done
}

main $@
