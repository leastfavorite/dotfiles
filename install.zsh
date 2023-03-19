#!/bin/zsh

DF_DIR=${${(%):-%x}:A:h}
path+="$DF_DIR/zsh/bin"

# make symlink w/ backup
make_link() {
    mkdir -p $(dirname $2)
    [[ -L $2 ]] && rm $2
    [[ -f $2 || -d $2 ]] && mv "$2" "$2.backup"
    ln -s $1 $2
}

DF_PLUG_VIM="$DF_DIR/local/vim-plug.vim"
if [[ ! -f $DF_PLUG_VIM ]]; then
    curl -fLo "$DF_PLUG_VIM" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

case $(os) in
    mac) brew install kitty coreutils python fzf neovim ripgrep bat node yarn wget ;;
esac

export DF_NPM_DIR="$DF_DIR/local/.npm_packages"
mkdir -p "$DF_NPM_DIR"
npm config set prefix "$DF_NPM_DIR"

make_link "$DF_PLUG_VIM" "$HOME/.local/share/nvim/site/autoload/plug.vim"
make_link "$DF_DIR/zsh/rc" "$HOME/.zshrc"
make_link "$DF_DIR/nvim/init.vim" "$HOME/.config/nvim/init.vim"
make_link "$DF_DIR/nvim/coc-settings.json" "$HOME/.config/nvim/coc-settings.vim"
make_link "$DF_DIR/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
make_link "$DF_DIR/misc/fly16.tmTheme" "$(bat --config-dir)/themes/fly16.tmTheme"
make_link "$DF_DIR/kitty/vim-kitty-navigator/neighboring_window.py" "$HOME/.config/kitty/neighboring_window.py"
make_link "$DF_DIR/kitty/vim-kitty-navigator/pass_keys.py" "$HOME/.config/kitty/pass_keys.py"

bat cache --build
python3 -m pip install --upgrade pip
pip3 install --user neovim

tic -x -o \~/.terminfo "$DF_DIR/kitty/xterm-kitty.infocmp"
