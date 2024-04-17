local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
local telescope = require('telescope')
telescope.load_extension('harpoon')


require("harpoon").setup({})

vim.keymap.set('n', '<leader>h', ui.toggle_quick_menu)
vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<leader>n', ui.nav_next)
vim.keymap.set('n', '<leader>N', ui.nav_prev)

vim.keymap.set('n', '<C-Space>h', function() ui.nav_file(1) end)
vim.keymap.set('n', '<C-Space>j', function() ui.nav_file(2) end)
vim.keymap.set('n', '<C-Space>k', function() ui.nav_file(3) end)
vim.keymap.set('n', '<C-Space>l', function() ui.nav_file(4) end)




