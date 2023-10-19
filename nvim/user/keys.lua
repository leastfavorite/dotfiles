local M = {
    'LionC/nest.nvim',
    lazy = false,
    priority = 1000
}

function M.init()
    -- set leader here (must be done before lazy.nvim)
    vim.keymap.set('n', 's', '', { noremap=true, silent=true })
    vim.g.mapleader = 's'
    vim.g.maplocalleader = 's'
end

function M.config()
    local kitty = require('user.kitty')
    require('nest').applyKeymaps {
        {'<leader>', {
            {'n', '<cmd>BufferNext<CR>'},
            {'N', '<cmd>BufferPrev<CR>'},
            {'b', '<cmd>BufferPick<CR>'},
            {'d', '<cmd>BufferDelete<CR>'},
            {'f', '<cmd>Telescope find_files<CR>'},
            {'g', '<cmd>Neogit<CR>'},
            {mode='vn', 'y', '"+y'}, -- <leader>y yanks to system clipboard

            -- these are wrapped in a thunk as to not reference MiniTrailspace
            -- before assignment
            {'w', function() MiniTrailspace.trim() end}
        }},
        {mode='v', {
            -- better indenting in visual mode
            {'<', '<gv'},
            {'>', '>gv'}
        }},
        {mode='vni', {
            {'<C-h>', function() kitty.navigate('h') end},
            {'<C-j>', function() kitty.navigate('j') end},
            {'<C-k>', function() kitty.navigate('k') end},
            {'<C-l>', function() kitty.navigate('l') end}
        }}
    }

    -- OTHER KEYBINDS:
    -- cmp.lua: contains mappings for when cmp menu is visible.
    --     this covers <CR>, <C-CR>, <Tab>, and <S-Tab>.
    -- besides <S-Tab> all of these should still be remappable
end
return M
