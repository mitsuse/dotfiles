#!/usr/bin/env python
# coding: utf-8


def main(args):
    from os import path
    localenv_dir = path.dirname(path.dirname(path.abspath(__file__)))
    expand_path = lambda *p: path.join(localenv_dir, *p)
    enable_zsh_config(expand_path('config', 'zsh'), args.dest)
    enable_tmux_config(expand_path('config', 'tmux'), args.dest)


def enable_zsh_config(config_dir, dest_dir):
    deploy_config(config_dir, dest_dir, 'zshrc')
    deploy_config(config_dir, dest_dir, 'zshrc_python')


def enable_tmux_config(config_dir, dest_dir):
    deploy_config(config_dir, dest_dir, 'tmux.conf')


def deploy_config(config_dir, dest_dir, config_name):
    import os
    import platform
    from os import path
    if platform.system() == 'Windows':
        file_name_template = '_{}'
    else:
        file_name_template = '.{}'
    config_path = path.join(config_dir, config_name)
    dest_path = path.join(dest_dir, file_name_template.format(config_name))
    if path.islink(dest_path):
        if path.realpath(dest_path) != config_path:
            print('** config file has been already linked: {}'.format(dest_path))
    elif path.exists(dest_path):
        print('!! file or directory already exists: {}'.format(dest_path))
    else:
        os.symlink(config_path, dest_path)


def parse_args(args):
    import os
    import argparse
    parser = argparse.ArgumentParser(description='')
    parser.add_argument('-d', '--dest', metavar='PATH', type=str,
        default=os.environ['HOME'],
        help='the path of a directory to which deploy configuration files')
    return parser.parse_args(args)


if __name__ == '__main__':
    import sys
    main(parse_args(sys.argv[1:]))
