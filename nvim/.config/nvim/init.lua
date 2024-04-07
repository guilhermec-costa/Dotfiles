require('me')
require("colorizer").setup()


local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 50,
        })
    end,
})

function Replace_in_range()
    local replacer = input();
        --[[ vim.cmd(":%s/" .. current .. "/" .. replacer .. "/g") ]]
end

vim.cmd("set nohlsearch")
