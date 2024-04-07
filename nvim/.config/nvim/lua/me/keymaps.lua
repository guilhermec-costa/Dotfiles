vim.api.nvim_set_hl(0, 'Normal', { bg = 'None' })
local keymap = vim.keymap.set
local options = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- Normal mode
keymap('n', '<C-k>', '<C-w>k', options)
keymap('n', '<C-j>', '<C-w>j', options)
keymap('n', '<C-l>', '<C-w>l', options)
keymap('n', '<C-h>', '<C-w>h', options)
keymap('n', "<leader>q", ":q", options)

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

-- nerdtree
keymap('n', '<leader>o', ':NERDTreeToggle<CR>', options)
keymap('n', '<leader>R', ':NERDTreeRefreshRoot<CR>', options)


vim.keymap.set('n', "<leader>ca", '<Cmd>lua vim.lsp.buf.code_action()<CR>', options);
vim.keymap.set('n', "<leader>rc", "<Cmd>lua vim.lsp.buf.range_code_action()<CR>",
    { noremap=true, silent=true, desc = "Code actions" });
-- Java specific
vim.keymap.set("n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", options)
vim.keymap.set("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>", options)
vim.keymap.set("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", options)
vim.keymap.set("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", options)
vim.keymap.set("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>", options)
vim.keymap.set("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", options)
vim.keymap.set("n", "<leader>rj", "<Esc><Cmd>JdtRestart<CR>", options)

-- oil setup
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
