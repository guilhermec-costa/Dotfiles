require("me.telescope.mappings")

local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local M = {}

M.grep_test = function()
    local opts = {}
    opts.search_dirs = { "./" }
    opts.prompt_title = "Random title"
    opts.path_display = { "smart" }
    opts.shorten_path = true
    require("telescope.builtin").live_grep(opts);
end

require("telescope").setup {
    defaults = {
        initial_mode = "insert",
        prompt_prefix = "$ ",
        mappings = {
            i = {
                ["<C-k>"] = {
                    actions.move_selection_previous, type = "action",
                    opts = { nowait = true, silent = true }
                },
                ["<C-j>"] = {
                    actions.move_selection_next, type = "action",
                    opts = { nowait = true, silent = true }
                },

                ["<CR>"] = "select_default"
            },
            n = {}
        },

        preview = {
            msg_bg_fillchar = "",
        },

        layout_strategy = "horizontal",
        sorting_strategy = "descending",
        layout_config = {
            horizontal = {
                preview_width = 0.4,
            },
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            }
        } },

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

return M
