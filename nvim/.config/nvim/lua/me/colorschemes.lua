--[[ vim.cmd 'colorscheme default' ]]

local options = {
    comments = "italic"
}
local palettes = {
    github_dark_colorblind = {},
    github_light = {
        comment = '#636e7b',
    },
}
local specs = {
    github_dark_colorblind = {
        bg1 = "#000000",
    }
}
local groups = {
    all = {
        IncSearch = { bg = 'palette.cyan' },
    },
}

require('github-theme').setup({

    options = options,
    palettes = palettes,
    specs = specs,
    groups = groups,

})

vim.cmd("colorscheme github_dark_colorblind")

--[[ vim.api.nvim_set_hl(0, "Normal", {bg = "none" }) ]]
--[[]]
--[[ local color_status, _ = pcall(vim.cmd, "colorscheme " .. default_color) ]]
--[[ if not color_status then ]]
--[[     vim.notify('Colorscheme ' .. default_color .. 'does not exist') ]]
--[[     return ]]
--[[ end ]]

