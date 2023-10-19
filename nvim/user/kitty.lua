local function send_kitten(kitten, args)

    -- format kitten escape code
    if type(args) == "table" then
        args = table.concat(args, '","')
    end
    local msg = '\027P@kitty-cmd{' ..
        '"cmd":"kitten",'..
        '"version":[0,14,2],'..
        '"no_response":true,'..
        '"payload":{'..
            '"kitten":"%s.py",'..
            '"args":["%s"]'..
        '}}\027\\'
    msg = msg:format(kitten, args)

    -- thx oscyank
    local success
    local fd = '/dev/fd/2'
    if vim.fn.filewritable(fd) == 1 then
        success = vim.fn.writefile({msg}, fd, 'b') == 0
    else
        success = vim.fn.chansend(vim.v.stderr, msg) > 0
    end
    return success
end

return {
    navigate = function(direction)
        local old_window = vim.fn.winnr()
        vim.cmd('wincmd ' .. direction)
        if (old_window == vim.fn.winnr()) then
            -- we are at the edge
            send_kitten('neighboring_window',
                ({h='left',j='bottom',k='top',l='right'})[direction])
        end
    end
}
