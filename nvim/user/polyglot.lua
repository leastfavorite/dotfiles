local M = {
    'sheerun/vim-polyglot',
    lazy = false
}

function M.init()
    vim.g.polyglot_disabled = {'autoindent'}
end

return M
