local M = {
    "bluz71/vim-moonfly-colors",
    lazy = false,
    priority = 1000,
}

function M.config()
    vim.cmd.colorscheme "moonfly"

    local function hi(group, opt) vim.api.nvim_set_hl(0, group, opt) end
    local function scrape(group)
        local hl = vim.api.nvim_get_hl_by_name(group, true)
        return {
            fg = ("#%06x"):format(hl.foreground),
            bg = ("#%06x"):format(hl.background)
        }
    end

    local palette = require("moonfly").palette

    hi("LineNr", {bg=palette.grey234, fg=palette.grey246})
    hi("SignColumn", {bg=palette.grey234})

    hi("CursorLineNr", {bg=palette.grey236, fg=palette.blue, bold=true})
    hi("CursorLineSign", {bg=palette.grey236})

    hi("IblIndent", {fg=palette.grey237})

    -- color targets for barbar.nvim
    local target_fg = palette.emerald
    local function buffer(t)
        hi("Buffer" .. t .. "Target", {
            fg = target_fg,
            bg = scrape("Buffer" .. t).bg,
            bold = true
        })
    end
    buffer("Current")
    buffer("Alternate")
    buffer("Inactive")
    buffer("Visible")

    -- kinda hate gitsigns lowkey
    hi("GitSignsAdd", {bg=palette.grey234, fg=palette.emerald})
    hi("GitSignsChange", {bg=palette.grey234, fg=palette.yellow})
    hi("GitSignsChangeDelete", {bg=palette.grey234, fg=palette.coral})
    hi("GitSignsDelete", {bg=palette.grey234, fg=palette.red})
    hi("GitSignsUntracked", {bg=palette.grey234, fg=palette.grey241})

    -- neogit
    hi("NeogitBranch", {fg=palette.blue, bold=true})
    hi("NeogitRemote", {fg=palette.purple, bold=true})
    hi("NeogitSectionHeader", {fg=palette.blue, bold=true})
    hi("NeogitUnmergedInto", {link="NeogitSectionHeader"})

    hi("NeogitChangeModified", {fg=palette.yellow, italic=true})
    hi("NeogitChangeAdded", {fg=palette.green, italic=true})
    hi("NeogitChangeDeleted", {fg=palette.red, italic=true})
    hi("NeogitChangeRenamed", {fg=palette.blue, italic=true})
    hi("NeogitChangeUpdated", {fg=palette.emerald, italic=true})
    hi("NeogitChangeCopied", {fg=palette.green, italic=true})
    hi("NeogitChangeBothModified", {fg=palette.coral, italic=true})
    hi("NeogitChangeNewFile", {fg=palette.green, italic=true})

    local hunk_bg = palette.grey234
    hi("NeogitHunkHeader", {fg=palette.blue, bg=palette.grey236, bold=true})
    hi("NeogitHunkHeaderHighlight", {fg=palette.blue, bg=palette.grey236, bold=true})
    hi("NeogitDiffContext", {bg=hunk_bg})
    hi("NeogitDiffContextHighlight", {bg=hunk_bg})
    hi("NeogitDiffAdd", {fg=palette.green, bg=hunk_bg})
    hi("NeogitDiffAddHighlight", {fg=palette.green, bg=hunk_bg})
    hi("NeogitDiffDelete", {fg=palette.red, bg=hunk_bg})
    hi("NeogitDiffDeleteHighlight", {fg=palette.red, bg=hunk_bg})

    vim.cmd("sign define NeogitOpen:hunk texthl=NeogitOpenHunk")
    vim.cmd("sign define NeogitOpen:section texthl=NeogitOpen")
    vim.cmd("sign define NeogitOpen:item texthl=NeogitOpen")
    vim.cmd("sign define NeogitClosed:hunk texthl=NeogitClosedHunk")
    vim.cmd("sign define NeogitClosed:section texthl=NeogitClosed")
    vim.cmd("sign define NeogitClosed:item texthl=NeogitClosed")
    hi("NeogitOpen", {bg=hunk_bg})
    hi("NeogitOpenHunk", {fg=palette.grey241, bg=palette.grey236, bold=true})
    hi("NeogitClosed", {bg=hunk_bg})
    hi("NeogitClosedHunk", {fg=palette.grey241, bg=palette.grey236, bold=true})
end

return M
