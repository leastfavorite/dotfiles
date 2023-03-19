" set leader
nnoremap s <Nop>
let mapleader = 's'

" zshrc in vim
set shellcmdflag=-ic

" tabs to 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4

" buffer traversal
nnoremap <leader>n :bn<CR>
nnoremap <leader>N :bp<CR>
nnoremap <leader>b :e#<CR>
nnoremap <leader>d :bp\|bd #<CR>

" paste from keyboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y

nnoremap <leader>p "+p
nnoremap <leader>P "+P

autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '+'
    \| execute 'OSCYankReg +'
    \| endif
" better indentation
vnoremap < <gv
vnoremap > >gv

" whitespace removal with sw
nnoremap <silent> <leader>w :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" easy align
xmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)
let g:easy_align_delimiters = {
    \ '(': { 'pattern': '(', 'left_margin': 2, 'right_margin': 0, 'stick_to_left': 0 }
    \ }
