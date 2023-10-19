vim.g.dotfile_folder = vim.fn.fnamemodify(
    vim.fn.resolve(vim.env.MYVIMRC), ":p:h:h")

local function source(file)
    dofile(vim.g.dotfile_folder .. "/nvim/" .. file .. ".lua")
end

source("keys")
source("plug")
source("rice")
