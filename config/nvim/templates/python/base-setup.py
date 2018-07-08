#!/usr/bin/env python3
# coding: utf-8

from setuptools import find_packages
from setuptools import setup

setup(
    name='',
    version='0.1.0',
    description=
    '',
    url='',
    author='Tomoya Kose',
    author_email='tomoya@mitsuse.jp',
    install_requires=[
        'typing-extensions>=3.6.2<=4.0.0',
    ],
    license='MIT',
    classifiers=[
        'Development Status :: 1 - Planning',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 3.6',
    ],
    keywords=[
    ],
    packages=find_packages(exclude=[
        'tests',
    ]),
    entry_points={
        'console_scripts': [],
    },
)
