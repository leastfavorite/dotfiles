local lazypath = vim.g.dotfile_folder .. "/local/lazy/lazy.nvim"


if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { 'bluz71/vim-moonfly-colors', priority=1000 },
    'bluz71/nvim-linefly',
    { 'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
    },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.4',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'lukas-reineke/indent-blankline.nvim', main = "ibl", opts = {} },
    { 'williamboman/mason.nvim', opts = {
        install_root_dir = vim.g.dotfile_folder .. "/local/mason"
    }},
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'tpope/vim-rsi',

    { 'hrsh7th/nvim-cmp', opts = {
        snippet = {
            expand = function(args) require('luasnip').lsp_expand(args.body) end
        }
    }},
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' }
}, {
    install = {colorscheme={'moonfly'}},
    root = vim.g.dotfile_folder .. "/local/lazy",
    lazy = false
})
