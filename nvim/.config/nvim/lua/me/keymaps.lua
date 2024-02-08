vim.api.nvim_set_hl(0, 'Normal', { bg = 'None' })
local keymap = vim.keymap.set
local options = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- Normal mode
keymap('n', '<C-k>', '<C-w>k', options)
keymap('n', '<C-j>', '<C-w>j', options)
keymap('n', '<C-l>', '<C-w>l', options)
keymap('n', '<C-h>', '<C-w>h', options)

keymap('n', '<C-s>l', ':vsplit<CR>', options)
keymap('n', '<C-s>j', ':split<CR>', options)
keymap('n', '<leader>q', ':q<Enter>', options)
keymap('n', '<leader>pv', function() vim.cmd('Ex') end)
keymap('n', '<leader>c', ':nohlsearch<Enter>', options)

-- window resizing
keymap('n', '<C-Up>', ':resize -2<CR>', options)
keymap('n', '<C-Down>', ':resize +2<CR>', options)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', options)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', options)

-- indent mode
keymap('v', '<', '<gv', options)
keymap('v', '>', '>gv', options)

keymap('v', '<A-j>', ':m .+2<CR>==gv', options)
keymap('v', '<A-k>', ':m .-2<CR>==gv', options)

-- keymap('n', '<leader>w', function()
--     vim.lsp.buf.format()
--     vim.cmd('w')
-- end)

-- scroll screen
keymap('n', '<C-u>', '<C-y>', options)
keymap('n', '<C-d>', '<C-e>', options)


-- nerdtree
keymap('n', '<leader>o', ':NERDTreeToggle<CR>', options)
keymap('n', '<leader>R', ':NERDTreeRefreshRoot<CR>', options)
