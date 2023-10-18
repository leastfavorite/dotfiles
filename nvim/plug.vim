" run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
    \| endif

" if you're not using my dotfile repo, use
" call plug#begin(stdpath('data') . '/plugged')
call plug#begin(g:dotfile_folder . '/local/plugged')

" Rice
Plug 'bluz71/vim-moonfly-colors'
Plug 'leastfavorite/vim-mistfly-statusline'
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
Plug 'tpope/vim-sleuth'

" Completion
let g:coc_global_extensions = [ 'coc-json', 'coc-marketplace',
            \'coc-clangd', 'coc-snippets', 'coc-svelte' ]
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Syntax
Plug 'fladson/vim-kitty'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-python/python-syntax'
Plug 'nachumk/systemverilog.vim'
let g:polyglot_disabled = ["autoindent"]
Plug 'sheerun/vim-polyglot'
Plug 'evanleck/vim-svelte'
Plug 'prisma/vim-prisma'

call plug#end()
