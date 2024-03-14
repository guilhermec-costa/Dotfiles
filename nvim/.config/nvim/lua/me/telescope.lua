local builtin = require('telescope.builtin')


vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--[[ vim.keymap.set('n', '<leader>fH', function() builtin.find_files({hiddeo=true}) end, {}) ]]
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
vim.keymap.set('n', '<leader>cb', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>S', builtin.git_stash, {})
vim.keymap.set('n', '<leader>qf', builtin.quickfix, {})
vim.keymap.set('n', '<leader>rs', builtin.search_history, {})
vim.keymap.set('n', '<leader>P', builtin.pickers, {})


-- enable colorscheme preview on switch

local actions = require('telescope.actions')
require("telescope").setup {
    pickers = {
        colorscheme = {
            enable_preview = true
        },

        -- enable live grep to work on hidden files
        live_grep = {
            additional_args = function()
                return { "--hidden" }
            end
        },

        find_files = {
            hidden = true
        }
    },
}

vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

