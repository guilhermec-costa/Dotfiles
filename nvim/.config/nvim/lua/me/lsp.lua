local lsp_status_ok, lsp_zero = pcall(require, 'lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    --[[ lsp_zero.default_keymaps({ buffer = bufnr }) ]]
    --[[ require "lsp_signature".on_attach({ ]]
    --[[     bind = true, -- This is mandatory, otherwise border config won't get registered. ]]
    --[[     handler_opts = { ]]
    --[[         border = "rounded" ]]
    --[[     }, ]]
    --[[ }, bufnr) ]]
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp_zero.default_setup,
    },
})

vim.keymap.set({ 'n' }, '<A-k>', function()
    require('lsp_signature').toggle_float_win()
end, { silent = true, noremap = true, desc = 'toggle signature' })
