local M = {
    {
        'folke/trouble.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
        }
    },
    {
        -- package manager for non-neovim things
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
        opts = {
            install_root_dir = vim.g.dotfile_folder .. "/local/mason"
        }
    },
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        dependencies = {
            {'williamboman/mason.nvim'}
        },
        opts = {
            ensure_installed = {
                "jedi-language-server",
                "ruff-lsp",
                "mypy"
            }
        }
    },
    {
        'neovim/nvim-lspconfig',
        cmd = {'LspInfo', 'LspInstall', 'LspStart'},
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'williamboman/mason.nvim'},
            {'VonHeikemen/lsp-zero.nvim'}
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({buffer = bufnr})
            end)

            local lspconfig = require('lspconfig')

            lspconfig.jedi_language_server.setup({
                filetypes = {"python"}
            })

            lspconfig.ruff_lsp.setup({
                filetypes = {"python"}
            })

            lspconfig.tsserver.setup({})
        end
    },
    {
        'nvimtools/none-ls.nvim',
        config = function()

            local venv_path = os.getenv('VIRTUAL_ENV')
            local py_path = nil
            -- decide which python executable to use for mypy
            if venv_path ~= nil then
                py_path = venv_path .. "/bin/python3"
            else
                py_path = vim.g.python3_host_prog
            end


            local null_ls = require('null-ls')
            null_ls.setup({
                sources = {
                    null_ls.builtins.diagnostics.mypy.with({
                        extra_args = {"--python-executable", py_path, "--strict"}
                    })
                }
            })
        end
    },
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            "rafamadriz/friendly-snippets"
        }
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            {'neovim/nvim-lspconfig'},
            {'VonHeikemen/lsp-zero.nvim'},

            -- completion sources
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},

            {'L3MON4D3/LuaSnip'},
            {'saadparwaiz1/cmp_luasnip'}
        },

        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local luasnip = require('luasnip')

            local cmp_action = lsp_zero.cmp_action()

            cmp.setup({
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = function(fallback)
                        if luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end,
                    ["<S-Tab>"] = cmp_action.luasnip_jump_backward(),
                    ["<CR>"] = cmp.mapping({
                        i = function(fallback)
                            if cmp.visible() and cmp.get_active_entry() then
                                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                            else
                                fallback()
                            end
                        end,
                        s = cmp.mapping.confirm({ select = true }),
                        c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                    }),
                    ["<C-CR>"] = function(fallback)
                        if cmp.visible() then
                            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
                        else
                            fallback()
                        end
                    end
                })
            })
        end
    }
}
return M
