#!/bin/bash

brew install \
    direnv \
    luajit \
    jq  \
    ghq \
    gibo \
    go \
    peco \
    pt \
    terraform \
    tmux

if [ "$(uname)" == 'Darwin' ]; then
    brew tap homebrew/cask

    # Core
    brew install \
        carthage \
        git \
        gnu-sed \
        swiftlint \
        libpq \
        zsh

    # Cask
    brew install \
        gimp \
        google-chrome \
        google-cloud-sdk
        java \
        slack
fi
