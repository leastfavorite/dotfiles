#!/bin/sh

DF_DIR=$(dirname -- $(realpath -- $0))
source "$DF_DIR/sh/rc.sh" || return -1

cd $DF_DIR
git submodule update --init --recursive

make_link() {
    mkdir -p $(dirname $2)
    if [ -L "$2" ]; then
        rm $2
    elif [ -f "$2" -o -d "$2" ]; then
        mv $2 "$2.backup"
    fi
    ln -s $1 $2
}

DF_PLUG_VIM="$DF_DIR/local/vim-plug.vim"
if [[ ! -f $DF_PLUG_VIM ]]; then
    curl -fLo "$DF_PLUG_VIM" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

make_link "$DF_PLUG_VIM" "$HOME/.local/share/nvim/site/autoload/plug.vim"
make_link "$DF_DIR/sh/rc.zsh" "$HOME/.zshrc"
make_link "$DF_DIR/nvim/init.vim" "$HOME/.config/nvim/init.vim"
make_link "$DF_DIR/nvim/coc-settings.json" "$HOME/.config/nvim/coc-settings.vim"
make_link "$DF_DIR/sh/rc.bash" "$HOME/.bashrc"
make_link "$DF_DIR/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
make_link "$DF_DIR/misc/fly16.tmTheme" "$(bat --config-dir)/themes/fly16.tmTheme"
make_link "$DF_DIR/kitty/vim-kitty-navigator/neighboring_window.py" "$HOME/.config/kitty/neighboring_window.py"
make_link "$DF_DIR/kitty/vim-kitty-navigator/pass_keys.py" "$HOME/.config/kitty/pass_keys.py"

bat cache --build
python3 -m pip install --upgrade pip
pip3 install --user neovim

tic -x -o \~/.terminfo "$DF_DIR/kitty/xterm-kitty.infocmp"
