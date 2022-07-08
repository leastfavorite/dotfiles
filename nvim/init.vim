" nvimrc

" if you're not using my dotfile repo, put all files in ~/.config/nvim/ and
" use this function instead:
"
" function! Source(filename)
"     let fullPath = stdpath('config') . '/' . a:filename . '.vim'
"     exec 'source ' . fullPath
" endfunction
"
let g:dotfile_folder = fnamemodify(resolve($MYVIMRC), ':p:h:h')
function! Source(filename)
    let fullPath = g:dotfile_folder . '/nvim/' . a:filename . '.vim'
    exec 'source ' . fullPath
endfunction

call Source('plug') " Plugin installation
call Source('rice') " Color scheme, status bar, etc.
call Source('keys') " Basic keybinds
call Source('comp') " Completion-based configuration
call Source('plugs/fzf') " FZF bindings
call Source('plugs/vimtex') " LaTeX
