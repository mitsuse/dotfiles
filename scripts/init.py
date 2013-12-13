#!/usr/bin/env python
# coding: utf-8


def main(args):
    from os import path
    localenv_dir = path.dirname(path.dirname(path.abspath(__file__)))
    expand_path = lambda *p: path.join(localenv_dir, *p)
    pyenv_dir = expand_path('tools', 'pyenv')
    pyenv_plugins_dir = expand_path('tools', 'pyenv-plugins')
    enable_zsh_config(expand_path('config', 'zsh'), args.dest)
    enable_tmux_config(expand_path('config', 'tmux'), args.dest)
    enable_pyenv_plugins(pyenv_plugins_dir, pyenv_dir)


def enable_zsh_config(config_dir, dest_dir):
    deploy(config_dir, dest_dir, 'zshrc')
    deploy(config_dir, dest_dir, 'zshrc_python')


def enable_tmux_config(config_dir, dest_dir):
    deploy(config_dir, dest_dir, 'tmux.conf')


def enable_pyenv_plugins(plugin_dir, pyenv_dir):
    import os
    dest_dir = os.path.join(pyenv_dir, 'plugins')
    deploy(plugin_dir, dest_dir, 'virtualenv', False)


def deploy(src_dir, dest_dir, target_name, hidden=True):
    import os
    import platform
    from os import path
    if hidden:
        if platform.system() == 'Windows':
            file_name_template = '_{}'
        else:
            file_name_template = '.{}'
    else:
        file_name_template = '{}'
    src_path = path.join(src_dir, target_name)
    dest_path = path.join(dest_dir, file_name_template.format(target_name))
    if path.islink(dest_path):
        if path.realpath(dest_path) != src_path:
            print('** config file has been already linked: {}'.format(dest_path))
    elif path.exists(dest_path):
        print('!! file or directory already exists: {}'.format(dest_path))
    else:
        os.symlink(src_path, dest_path)


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
