local options = {
    dim_inactive = true,
    styles = {
        functions = "bold",
        comments = "bold"
    }
}

local palettes = {
    github_dark_colorblind = {
        bg1 = "#060009",
        bg2 = "#060030",
        bg3 = "#060050",
        fg1 = "#ffffff",
        fg2 = "#ffffff",
        sel1 = "#c17fff",
        magenta = {
            base = "#c17fff",
            bright = "#ff59d4"
        },
        yellow = {
            base = "#ff9300"
        },
    },
}

local specs = {
    github_dark_colorblind = {
        bg1 = "bg1",
        bg2 = "bg2",
        bg3 = "bg3",
        fg1 = "fg1",
        fg2 = "fg2",
        fg3 = "magenta.base",
        sel1 = "sel1",
        syntax = {
            keyword = "yellow.base",
            bracket = "magenta.bright",
            number = "#ffca5a",
            field = "#54a4ff",
            const = "#54a4f0",
        }
    }
}

local groups = {
    github_dark_colorblind = {
        IncSearch = { bg = "palette.magenta.base", fg = "#ffffff" },
    },
}

require("github-theme").setup({

    options = options,
    palettes = palettes,
    specs = specs,
    groups = groups,

})

vim.cmd("colorscheme github_dark_colorblind")
