local M = {
    {
        -- allows copying thru SSH
        'ojroques/nvim-osc52',
        lazy = false,

        -- use osc52 on yank to +
        config = function()
            vim.api.nvim_create_autocmd({ "TextYankPost" }, {
                callback = function(_)
                    if vim.v.event.operator == 'y' and
                            vim.v.event.regname == '+' then
                        require('osc52').copy_register('+')
                    end
                end
            })
        end
    },
    {
        -- a set of small utilities. we only use a couple
        'echasnovski/mini.nvim',
        version = '*',
        config = function()
            -- highlight trailing spaces and remove them
            require('mini.trailspace').setup()
            -- tools to comment/uncomment lines of code
            require('mini.comment').setup()
        end
    },
    "tpope/vim-rsi", -- ctrl+a, ctrl+e in insert mode
    "tpope/vim-sleuth" -- determine tabs vs spaces
}
return M
