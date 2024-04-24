local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
    history = true,
    updateevents = "TextChanged, TextChangedI",
    enable_autosnippets = true
}
