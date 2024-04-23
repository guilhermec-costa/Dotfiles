local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = {
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        ['<C-n>'] = cmp_action.luasnip_supertab(),
        ['<C-m>'] = cmp_action.luasnip_shift_supertab()
    },
    formatting = {
        fields = {
            cmp.ItemField.Menu,
            cmp.ItemField.Abbr,
            cmp.ItemField.Kind,
        }
    },
    sources = {
        { name = "nvim_lua"},
        { name = "nvim_lsp", keyword_length = 3},
        { name = "vsnip" },
        { name = "path" },
        { name = "buffer" },
    },
})


