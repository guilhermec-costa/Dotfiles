local builtin = require('telescope.builtin')
local skm = vim.keymap.set

local action_state = require "telescope.actions.state"

local function grep_test()
    local opts = {}
    opts.search_dirs = {"./"}
    opts.prompt_title = "Random title"
    opts.path_display = { "smart" }
    opts.shorten_path = true
    require("telescope.builtin").live_grep(opts);
end


skm('n', '<leader>ff', builtin.find_files, {})
skm('n', '<leader>bd', grep_test, {})
skm('n', '<leader>fg', builtin.live_grep, {})
skm('n', '<leader>sw', builtin.grep_string, {})
skm('n', '<leader>fb', builtin.buffers, {})
skm('n', '<leader>fh', builtin.help_tags, {})
skm('n', '<leader>?', builtin.oldfiles, {})
skm('n', '<leader>cs', builtin.colorscheme, {})
skm('n', '<leader>K', builtin.keymaps, {})
skm('n', '<leader>gr', builtin.lsp_references, {})
skm('n', '<leader>ds', builtin.lsp_document_symbols, {})
skm('n', 'gd', builtin.lsp_definitions, {})
skm('n', '<leader>rn', vim.lsp.buf.rename, {})
skm('n', '<leader>D', builtin.diagnostics, {})
skm('n', '<leader>gf', builtin.git_files, {})
skm('n', '<leader>B', builtin.git_branches, {})
skm('n', '<leader>cc', builtin.git_commits, {})
skm('n', '<leader>cb', builtin.git_bcommits, {})
skm('n', '<leader>S', builtin.git_stash, {})
skm('n', '<leader>qq', builtin.quickfix, {})
skm('n', '<leader>rs', builtin.search_history, {})
skm('n', '<leader>P', builtin.pickers, {})
skm('n', '<leader>c', builtin.commands, {})
skm('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

require("telescope").setup {
    mappings = {
        i =  {
            ["<C-y>"] = require("telescope.actions").move_selection_next
        }
    },
    extensions = {
      ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }},

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
        },
    },
}


require("telescope").load_extension("ui-select")

local M = {}


return M
