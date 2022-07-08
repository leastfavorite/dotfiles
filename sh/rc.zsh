#!/usr/bin/zsh
#
## if not running interactively, return
[[ $- != *i* || -n $DF_FORCE_RC ]] && return

. "$(dirname -- $(realpath -- "${(%):-%x}"))/rc.sh"

setopt GLOB_DOTS
bindkey -e
setopt appendhistory
export HISTFILE="$HOME/.zsh_hist"

# ctrl+z -> fg
fancy-ctrl-z() {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER=" fg"
	zle accept-line -w
    else
        zle push-input -w
	zle clear-screen -w
    fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
export ZSH_AUTOSUGGEST_COMPLETION_IGNORE="fg"
setopt HIST_IGNORE_SPACE

source $DF_DIR/sh/theme.zsh
source $DF_DIR/sh/grmlcomp.zsh > /dev/null

for plugin in $(ls $DF_DIR/sh/plug); do
    source $DF_DIR/sh/plug/$plugin/$plugin.plugin.zsh
done
