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

    brew install \
        carthage \
        git \
        gnu-sed \
        swiftlint \
        zsh

    brew cask install \
        gimp \
        google-chrome \
        google-cloud-sdk
        java \
        pusher \
        slack
fi
