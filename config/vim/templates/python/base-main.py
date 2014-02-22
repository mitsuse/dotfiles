#!/usr/bin/env python
# coding: utf-8


def main(args):
    pass


def parse_args(args):
    import argparse
    parser = argparse.ArgumentParser(description='')
    return parser.parse_args(args)


if __name__ == '__main__':
    import sys
    main(parse_args(sys.argv[1:]))
