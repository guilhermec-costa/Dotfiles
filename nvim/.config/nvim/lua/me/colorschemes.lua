vim.cmd 'colorscheme default'

local default_color = 'tokyonight-storm'

local color_status, _ = pcall(vim.cmd, "colorscheme " .. default_color)
if not color_status then
    vim.notify('Colorscheme ' .. default_color .. 'does not exist')
    return
end
