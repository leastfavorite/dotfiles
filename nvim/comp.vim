set signcolumn=auto

" ctrl+space to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" go to diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" coc-fix
nmap <silent> <leader>f <Plug>(coc-fix-current)

" go to code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Map function and class text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" c++ switch source and header
augroup coc_augroup
    autocmd!
    autocmd FileType c,cpp,h,hpp nnoremap <leader>h :<C-u>CocCommand clangd.switchSourceHeader<CR>
augroup end

" CocExplorer
nmap <leader>o :CocCommand explorer<CR>

inoremap <silent><expr> <CR> coc#pum#visible() && coc#pum#info()["index"] > 0 ? coc#pum#confirm() 
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <S-CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:python_highlight_all = 1
let g:vim_json_conceal = 0
