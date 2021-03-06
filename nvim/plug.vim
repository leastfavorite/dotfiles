" run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
    \| endif

" if you're not using my dotfile repo, use
" call plug#begin(stdpath('data') . '/plugged')
call plug#begin(g:dotfile_folder . '/local/plugged')

" Rice
Plug 'bluz71/vim-moonfly-colors'
Plug 'bluz71/vim-moonfly-statusline'
Plug 'ap/vim-buftabline'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'

" Utility
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'leastfavorite/vim-kitty-navigator'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'airblade/vim-rooter'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rsi'
Plug 'junegunn/vim-easy-align'
Plug 'ojroques/vim-oscyank', {'branch': 'main'}

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fannheyward/coc-marketplace', {'do': 'yarn install --frozen-lockfile'}
Plug 'clangd/coc-clangd', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Syntax
Plug 'fladson/vim-kitty'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-python/python-syntax'
Plug 'nachumk/systemverilog.vim'
Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'

call plug#end()
