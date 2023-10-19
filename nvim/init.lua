vim.g.dotfile_folder = vim.fn.fnamemodify(
    vim.fn.resolve(vim.env.MYVIMRC), ":p:h:h")
package.path = package.path .. ";" .. vim.g.dotfile_folder .. "/nvim/?.lua"

-- install lazy.nvim if it doesnt exist
local lazypath = vim.g.dotfile_folder .. "/local/lazy"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath .. "/lazy.nvim"
  })
end
vim.opt.rtp:prepend(lazypath .. "/lazy.nvim")

-- insert packages

require("lazy").setup {
    spec = require("user.spec"),
    install = { colorscheme = {'moonfly'} },
    root = lazypath,
    lazy = false,
    change_detection = {
        enabled = true,
        notify = false,
    }
}
