local M = {
    {
        -- tabline plugin to make the tabline show files instead of tabs
        'romgrk/barbar.nvim',
        dependencies = {
          'lewis6991/gitsigns.nvim', -- for git integration
          'nvim-tree/nvim-web-devicons'
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            icons = {
                button = false, -- remove the 'x' button
                modified = { button = "" }
            }
        }
    },
    {
        -- shows git diff in the sign column
        'lewis6991/gitsigns.nvim',
        opts = { signcolumn = true } -- turns the thing on
    },
    {
        -- our trusty status line!
        'bluz71/nvim-linefly',
        lazy = false,
        opts = {},
        -- we use this to allow vim-kitty-navigator to detect vim even through
        -- nested shells. it just checks the text of the window for this symbol
        config = function()
            vim.g.linefly_options = {progress_symbol = ""}
        end
    }
}
return M
