vim.cmd 'colorscheme default'

local options = {
    styles = {
        functions = "bold",
        comments = "bold"
    }
}

local palettes = {
    github_dark_colorblind = {
        bg1 = "#000009",
        bg2 = "#1b0045",
        bg3 = "#1b0045",
        bg4 = "#1b0045",
        sel0 = '#1b0045',
        fg1 = "#ddffff"
    },
    github_light = {
        comment = '#636e7b',
    },
}
local specs = {
    github_dark_colorblind = {
        bg1 = "bg1",
        bg2 = "bg2",
        bg3 = "bg3",
        fg2 = "fg1",
        sel0 = "sel0",
        inactive = "#ffffff"
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

--[[ vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) ]]
--[[]]
--[[ local color_status, _ = pcall(vim.cmd, "colorscheme " .. default_color) ]]
--[[ if not color_status then ]]
--[[     vim.notify('Colorscheme ' .. default_color .. 'does not exist') ]]
--[[     return ]]
--[[ end ]]
