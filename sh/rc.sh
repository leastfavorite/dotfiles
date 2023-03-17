# ari's dotfiles

# get os
DF_OS=
case $OSTYPE in
    "darwin"*) DF_OS="mac" ;;
    *) DF_OS= ;;
esac
export DF_OS

info() { echo -e "\033[0;34mINFO: $@\033[0m"; }
warn() { echo -e "\033[0;33mWARN: $@\033[0m"; }
error() { echo -e "\033[0;31mERROR: $@\033[0m"; }

# default mac echo automatically escapes--alternatively:
# if [ $DF_OS = "mac" ]; then alias echo="gecho"; fi
if [ $DF_OS = "mac" ]; then
    info() { echo "\033[0;34mINFO: $@\033[0m"; }
    warn() { echo "\033[0;33mWARN: $@\033[0m"; }
    error() { echo "\033[0;31mERROR: $@\033[0m"; }
fi

# install packages
# case $DF_OS in
#     "mac")
#         DF_PKGS_TO_INSTALL=`mktemp`
#         DF_INSTALLED_PKGS=`brew list`
#         install_pkg() {
#             if ! echo $DF_INSTALLED_PKGS | grep -q "\b$1\b"; then
#                 warn "Package '$1' not found. Trying to install..."
#                 echo $1 >> $DF_PKGS_TO_INSTALL
#             fi
#         }
#         install_pkg kitty
#         install_pkg coreutils
#         install_pkg python
#         install_pkg fzf
#         install_pkg neovim
#         install_pkg ripgrep
#         install_pkg bat
#         install_pkg node
#         install_pkg yarn
# 	install_pkg wget

#         if [ -s "$DF_PKGS_TO_INSTALL" ]; then
# 	    brew install `cat $DF_PKGS_TO_INSTALL`
#         fi
#     ;;
#     # TODO: add more package installs for other OSes
# esac

# get dotfile directory
if [ -z "$DF_DIR" ]; then
    DF_SHELL=`ps -p $$ | awk '(NR>1){print $NF}'`
    case $DF_SHELL in
        "zsh") DF_DIR="${(%):-%x}" ;;
        "bash") DF_DIR="${BASH_SOURCE[0]}" ;;
        *) DF_DIR="$0" ;;
    esac
    export DF_DIR=$(dirname -- $(dirname -- $(realpath -- $DF_DIR)))
fi

# ssh agent
ssh_check() {
    ! ssh-add -l >/dev/null && [ -d $HOME/.ssh ] && \
        find "$HOME/.ssh" -name '*.pub' >/dev/null && \
        info "Running ssh-agent..." && ssh-add;
}
ssh_check

git config --global alias.checkeven "!sh $DF_DIR/sh/git_checkeven.sh"

# check for updates
(
    cd $DF_DIR
    git fetch
    even=`git checkeven`
    case $even in
        *"behind"*) warn "Current dotfiles are behind origin. Consider updating." ;;
        *"ahead"*) warn "Current dotfiles are ahead of origin. Consider pushing." ;;
        *"diverge"*) warn "Current dotfiles have diverged from origin. Consider merging." ;;
    esac
)

# yarn setup
export DF_NPM_DIR="$DF_DIR/local/.npm_packages"
mkdir -p "$DF_NPM_DIR"
npm config set prefix "$DF_NPM_DIR"
export PATH="$PATH:$DF_NPM_DIR/bin"
export MANPATH="$MANPATH:$DF_NPM_DIR/share/man"

# shell stuff
export HISTCONTROL=ignoreboth:erasedups
export SAVEHIST=9999999
export HISTSIZE=9999999
export EDITOR="nvim"
export VISUAL="nvim"
export LS_COLORS="$LS_COLORS:ow=1;94"

# bat theme
export BAT_THEME="fly16"

# aliases
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -la'
alias l='ls'
alias l.="ls -A | egrel '^\.'"

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias wget='wget -c'

alias psa='ps auxf'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'

alias rg='rg --sort path'
alias todo='$EDITOR $HOME/todo.txt'

# ssh wrapper with agent forwarding. automatically
# tries to enter zsh
function s() {
    ssh_check
    ssh -At $@ -- 'zsh -l'
}
