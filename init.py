#!/usr/bin/env python
# coding: utf-8


def main(args):
    from os import path
    localenv_dir = path.dirname(path.abspath(__file__))
    expand_path = lambda *p: path.join(localenv_dir, *p)
    pyenv_dir = expand_path('tools', 'pyenv')
    pyenv_plugins_dir = expand_path('tools', 'pyenv-plugins')
    rbenv_dir = expand_path('tools', 'rbenv')
    rbenv_plugins_dir = expand_path('tools', 'rbenv-plugins')
    enable_zsh_config(expand_path('config', 'zsh'), args.dest)
    enable_tmux_config(expand_path('config', 'tmux'), args.dest)
    enable_pyenv_plugins(pyenv_plugins_dir, pyenv_dir)
    enable_git_config(expand_path('config', 'git'), args.dest)
    enable_vim_config(expand_path('config', 'vim'), args.dest)
    enable_vimperator_config(expand_path('config', 'vimperator'), args.dest)
    enable_readline_config(expand_path('config', 'readline'), args.dest)


def enable_readline_config(config_dir, dest_dir):
    deploy(config_dir, dest_dir, 'inputrc')


def enable_zsh_config(config_dir, dest_dir):
    deploy(config_dir, dest_dir, 'zshrc')
    deploy(config_dir, dest_dir, 'zshrc_python')


def enable_tmux_config(config_dir, dest_dir):
    deploy(config_dir, dest_dir, 'tmux.conf')
    

def enable_pyenv_plugins(plugin_dir, pyenv_dir):
    import os
    dest_dir = os.path.join(pyenv_dir, 'plugins')
    deploy(plugin_dir, dest_dir, 'virtualenv', False)


def enable_git_config(config_dir, dest_dir):
    deploy(config_dir, dest_dir, 'gitconfig')


def enable_vim_config(config_dir, dest_dir):
    import os
    from os import path
    vim_config_dir = path.join(dest_dir, '.vim')
    vimrc_filter = lambda p: p.startswith('vimrc_')
    deploy(config_dir, dest_dir, 'vimrc')
    for config_name in filter(vimrc_filter, os.listdir(config_dir)):
        deploy(config_dir, dest_dir, config_name)
    deploy(config_dir, vim_config_dir, 'neobundle.vim', False)
    deploy(config_dir, vim_config_dir, 'templates', False)
    deploy(config_dir, vim_config_dir, 'colors', False)
    deploy(config_dir, vim_config_dir, 'dict', False)


def enable_vimperator_config(config_dir, dest_dir):
    deploy(config_dir, dest_dir, 'vimperatorrc')


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
    if not path.exists(dest_dir):
        try:
            os.makedirs(dest_dir)
        except:
            print('!! fail to create a directory: {}'.format(dest_dir))
            return
    elif not path.isdir(dest_dir):
        print('!! file or directory already exists: {}'.format(dest_dir))
        return
    if path.islink(dest_path):
        link_target_path = path.realpath(dest_path)
        if link_target_path != src_path:
            template = '!! you have link to another path: {} => {}'
            print(template.format(dest_path, link_target_path))
        else:
            template = '** you already have link: {} => {}'
            print(template.format(dest_path, link_target_path))
    elif path.exists(dest_path):
        print('!! file or directory already exists: {}'.format(dest_path))
    else:
        template = '>> create new link: {} => {}'
        print(template.format(dest_path, src_path))
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
