#!/bin/bash

# if not running interactively, return
[[ $- != *i* || -n $DF_FORCE_RC ]] && return

. "$(dirname -- $(realpath -- "${BASH_SOURCE[0]}"))/rc.sh"

export HISTFILE="$HOME/.bash_hist"

PROMPT_SSH_PREFIX=""
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    PROMPT_SSH_PREFIX='\[\e[90m\]\H \[\e[95m\]♥ '
fi

export PS1="$PROMPT_SSH_PREFIX"'\[\e[1;33m\]\w\[\e[m\]'$'\n'"$PROMPT_JWS\[\e[95m\]\u \[\e[34m\]»\[\e[m\] "
