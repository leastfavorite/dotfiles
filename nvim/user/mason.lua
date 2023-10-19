local M = {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
    opts = {
        install_root_dir = vim.g.dotfile_folder .. "/local/mason"
    }
}

return M
