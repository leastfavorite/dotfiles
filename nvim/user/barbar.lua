local M = {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons'
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
        icons = {
            button = false,
            modified = { button = "" }
        }
    }
    -- note: some additional theming is done in colorscheme.lua
}

return M
