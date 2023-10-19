local M = {
    -- allows copying thru SSH
    'ojroques/nvim-osc52',
    lazy = false,
}

function M.config()
    vim.api.nvim_create_autocmd({ "TextYankPost" }, {
        callback = function(evt)
            if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
                require('osc52').copy_register('+')
            end
        end
    })
end

return M
