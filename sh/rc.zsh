#!/usr/bin/zsh

# if not running interactively, return
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

# kitty window setting
# set_window_title() {
#     if (( $+commands[kitty] )); then
#         kitty @ set-window-title "$1"
#     else
#         ECHO_CMD="echo -e"
#         if [ "$DF_OS" = "mac" ]; then
#             ECHO_CMD="echo"
#         fi
#         $ECHO_CMD -n '\eP@kitty-cmd{"cmd":"set-window-title","version":[0,14,2],"no_response":true,"payload":{"title":"'"$1"'"}}\e\\' > /dev/tty
#     fi
# }

# kitty_window_title_precmd() {
#     set_window_title "zsh"
# }

# kitty_window_title_preexec() {
#     if [ "$2" = "fg" ]; then
#         if [ -n "`jobs`" ] ; then
#             set_window_title "$(jobs %+ | cut -wf 4- | envsubst | cut -wf 1)"
#         fi
#     else
#         set_window_title "$(echo $2 | envsubst | cut -wf 1)"
#     fi
# }

# autoload -Uz add-zsh-hook
# add-zsh-hook -d precmd kitty_window_title_precmd
# add-zsh-hook precmd kitty_window_title_precmd
# add-zsh-hook -d preexec kitty_window_title_preexec
# add-zsh-hook preexec kitty_window_title_preexec

source $DF_DIR/sh/theme.zsh
source $DF_DIR/sh/grmlcomp.zsh > /dev/null

for plugin in $(ls $DF_DIR/sh/plug); do
    source $DF_DIR/sh/plug/$plugin/$plugin.plugin.zsh
done
