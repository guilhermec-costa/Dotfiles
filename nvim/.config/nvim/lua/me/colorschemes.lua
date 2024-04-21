vim.cmd 'colorscheme default'

local default_color = 'github_dark_colorblind'

vim.api.nvim_set_hl(0, "Normal", {bg = "none" })

local color_status, _ = pcall(vim.cmd, "colorscheme " .. default_color)
if not color_status then
    vim.notify('Colorscheme ' .. default_color .. 'does not exist')
    return
end
