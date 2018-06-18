#!/bin/bash

find ~/Downloads -maxdepth 1 -ctime +3h -exec rm -r {} \;
rm -r ~/.Trash/*
