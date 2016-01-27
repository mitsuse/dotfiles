#!/usr/bin/env python3
# coding: utf-8


def task(f):
    def wrap(*args, **kwargs):
        print('> "{}"'.format(f.__name__))
        return f(*args, **kwargs)
    return wrap


@task
def install(script, context):
    error = clean(script, context)
    if error is not None:
        return error
    print()

    error = link(script, context)
    if error is not None:
        return error
    print()

    return None


@task
def link(script, context):
    import sys
    import os
    from os import path

    def link_file(source_path, target_path):
        print("{} -> {}".format(source_path, target_path))
        try:
            os.link(source_path, target_path)
        except OSError as error:
            return error
        return None

    return process(script, context, link_file)


@task
def clean(script, context):
    import os
    from os import path

    def clean_file(source_path, target_path):
        print(target_path)
        if path.exists(target_path):
            try:
                os.remove(target_path)
            except OSError as error:
                return error
        return None

    return process(script, context,clean_file)


def process(script, context, f):
    import os
    from os import path

    root_path = get_root_path(script)
    dest_path = path.abspath(context.dest)

    is_source = gen_is_source(script)

    for name in list_dir(root_path, is_source):
        source_path = path.join(root_path, name)
        target_path = path.join(dest_path, '.{}'.format(name))

        error = f(source_path, target_path)
        if error is not None:
            return error

    return None


def gen_is_source(script):
    return lambda p: not is_hidden(p) and not gen_is_me(script, p)


def gen_is_me(script, path):
    import os
    return os.path.basename(script) == path


def is_hidden(path):
    import os
    return os.path.basename(path).startswith('.')


def list_dir(path, f):
    import os
    return filter(f, os.listdir(path))

def get_root_path(script):
    from os import path
    return path.abspath(path.dirname(script))


def parse_args(args):
    import os
    from argparse import ArgumentParser

    home_path = os.environ['HOME']

    parser = ArgumentParser()
    subparsers = parser.add_subparsers(dest='subcommand')
    actions = {}

    install_name = 'install'
    install_command = subparsers.add_parser(
        name=install_name,
        help='create links to dotfile under ${HOME}.',
    )
    actions[install_name] = install

    install_command.add_argument(
        '--dest',
        '-d',
        type=str,
        default=home_path,
        help='the path which stores links to dotfile: {}'.format(home_path),
    )

    clean_name = 'clean'
    clean_command = subparsers.add_parser(
        name=clean_name,
        help='clean up links to dotfile contained in ${HOME}.',
    )
    actions[clean_name] = clean

    clean_command.add_argument(
        '--dest',
        '-d',
        type=str,
        default=home_path,
        help='the path which stores links to dotfile: {}'.format(home_path),
    )

    context = parser.parse_args(args)
    if context.subcommand is None:
        return None, parser.format_help()

    context.subcommand = actions[context.subcommand]

    return context, None


if __name__ == '__main__':
    import sys

    context, error = parse_args(sys.argv[1:])
    if error is not None:
        print(error)
        sys.exit()

    error = context.subcommand(sys.argv[0], context)
    if error is not None:
        print(error)
        sys.exit()
