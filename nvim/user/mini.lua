local M = {
    'echasnovski/mini.nvim',
    version = '*'
}

function M.config()
    require('mini.trailspace').setup()
    require('mini.comment').setup()
end
return M
