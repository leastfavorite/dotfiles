local M = {
    'NeogitOrg/neogit',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "sindrets/diffview.nvim",
        "ibhagwan/fzf-lua",
    },
    opts = {
        disable_line_numbers = false,
        disable_context_highlighting = true,
        signs = {
            hunk = {"", "󰍝"},
            item = {"", "󰍝"},
            section = {"", ""}
        }
    }
}
return M
