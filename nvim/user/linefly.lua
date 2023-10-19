local M = {
    'bluz71/nvim-linefly',
    lazy = false,
    opts = {
    },
    config = function()
	-- we use this to allow vim-kitty-navigator
	-- to detect vim even through nested shells.
	-- it just checks the text of the window for
        -- this symbol
        vim.g.linefly_options = {progress_symbol = ""}
    end
}

return M
