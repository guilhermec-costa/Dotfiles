local builtin = require('telescope.builtin')
local actions = require("telescope.actions")
local telescope = require("telescope")

vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>ff', function() builtin.find_files({hidden=false}) end, {})
vim.keymap.set('n', '<leader>fH', function() builtin.find_files({hidden=true}) end, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sw', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>?', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>cs', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>K', builtin.keymaps, {})
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, {})
vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
vim.keymap.set('n', '<leader>D', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>B', builtin.git_branches, {})
vim.keymap.set('n', '<leader>C', builtin.git_commits, {})

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-n>"] = actions.move_selection_next,
                ["<C-m>"] = actions.move_selection_previous
            }
        }
    }
})

