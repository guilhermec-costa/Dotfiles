require("me.telescope.mappings")
local random_plugin = require("random-plugin")

random_plugin.setup({
    title = "Churros Augusto"
})

local options = { noremap = true }

local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local M = {}

M.grep_home = function()
    local opts = {}
    opts.search_dirs = { "~/" }
    opts.prompt_title = "Home files"
    opts.path_display = { "absolute" }
    opts.hidden = true
    require("telescope.builtin").find_files(opts);
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
            n = {
                ["<C-a>"] = function()
                    local entry = action_state.get_selected_entry()
                    local current_path = entry[1]
                    vim.cmd('redir @k | echo "' .. current_path .. '"' .. "| redir END")
                end
            }
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
