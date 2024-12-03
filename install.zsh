#!/bin/zsh
set -e

DF_DIR=${${(%):-%x}:A:h}
path+="$DF_DIR/zsh/bin"
path+="$DF_DIR/local/bin"

git --git-dir="$DF_DIR/.git" submodule update --init --recursive

# make symlink w/ backup
make_link() {
    mkdir -p $(dirname $2)
    [[ -L $2 ]] && rm $2
    [[ -f $2 || -d $2 ]] && mv "$2" "$2.backup"
    ln -s $1 $2
}

case $(os) in
    mac) brew install kitty coreutils python neovim ripgrep bat wget ;;
    debian)
        sudo apt install -y curl kitty ripgrep bat fuse python3-pip
        make_link /usr/bin/batcat "$DF_DIR/local/bin/bat"
        sudo apt update && sudo apt upgrade
        curl -fsSL https://github.com/neovim/neovim/releases/download/stable/nvim.appimage > "$DF_DIR/local/bin/nvim"
        chmod u+x "$DF_DIR/local/bin/nvim"
    ;;
    fedora) sudo yum install -y kitty coreutils python python3-pip neovim ripgrep bat ;;
esac

make_link "$DF_DIR/zsh/rc" "$HOME/.zshrc"
make_link "$DF_DIR/nvim/init.lua" "$HOME/.config/nvim/init.lua"
make_link "$DF_DIR/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
make_link "$DF_DIR/misc/fly16.tmTheme" "$(bat --config-dir)/themes/fly16.tmTheme"
make_link "$DF_DIR/kitty/vim-kitty-navigator/neighboring_window.py" "$HOME/.config/kitty/neighboring_window.py"
make_link "$DF_DIR/kitty/vim-kitty-navigator/pass_keys.py" "$HOME/.config/kitty/pass_keys.py"

bat cache --build
# break system packages is probably bad, but otherwise we won't get
# a new enough version of py-nvim
python3 -m pip install --upgrade pip --break-system-packages
pip3 install --user neovim --break-system-packages

tic -x -o \~/.terminfo "$DF_DIR/kitty/xterm-kitty.infocmp"
