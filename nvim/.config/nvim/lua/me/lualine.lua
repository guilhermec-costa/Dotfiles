require('lualine').setup {
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', file_status = true, path = 1 } },
        lualine_x = { 'encoding', 'fileformat' },
    },
}
