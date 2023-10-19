local M = {}

local function spec(item)
    table.insert(M, require(item))
end
local function also(item)
    table.insert(M, item)
end

require "user.options"

spec "user.ibl"
spec "user.gitsigns"
spec "user.colorscheme"
spec "user.linefly"
spec "user.barbar"
spec "user.telescope"
spec "user.oscyank"
spec "user.mini"
spec "user.neogit"

-- things that need no user setup
also "tpope/vim-rsi"
also "tpope/vim-sleuth"

-- syntax
spec "user.polyglot"

-- lsp support
spec "user.lspzero"
spec "user.mason"
spec "user.cmp"
also "hrsh7th/cmp-buffer"
also "hrsh7th/cmp-path"
also "hrsh7th/cmp-cmdline"
spec "user.lspconfig"

spec "user.keys"


return M
