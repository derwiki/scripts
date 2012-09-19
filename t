#!/bin/bash

SOCK_SYMLINK=~/.ssh/ssh_auth_sock

[ -r $SSH_AUTH_SOCK ] && ln -sf $SSH_AUTH_SOCK $SOCK_SYMLINK
env SSH_AUTH_SOCK=$SOCK_SYMLINK tmux $@ attach
