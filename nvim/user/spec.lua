local M = {}

local function spec(item)
    table.insert(M, require(item))
end

local function specs(item)
    for _, v in ipairs(require(item)) do
        table.insert(M, v)
    end
end

local function also(item)
    table.insert(M, item)
end

require "user.options"

-- handles config for sidebar as well as top and bottom bar
specs "user.bars"

spec "user.ibl"
spec "user.colorscheme"

-- utilities
specs "user.utils"

-- modals
spec "user.neogit"
spec "user.telescope"

-- syntax
spec "user.polyglot"

-- lsp support
specs "user.lsp"

spec "user.keys"


return M
