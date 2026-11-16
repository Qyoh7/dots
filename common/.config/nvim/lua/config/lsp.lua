vim.keymap.set('n', 'gl',  vim.diagnostic.open_float)
vim.keymap.set('n', 'gp', function() vim.diagnostic.jump({count = -1}) end)
vim.keymap.set('n', 'gn', function() vim.diagnostic.jump({count = 1}) end)
vim.keymap.set('n', 'K',   vim.lsp.buf.hover,         opts)
vim.keymap.set('n', 'gd',  vim.lsp.buf.definition,    opts)
vim.keymap.set('n', 'gD',  vim.lsp.buf.declaration,   opts)
vim.keymap.set('n', 'gi',  vim.lsp.buf.implementation, opts)
vim.keymap.set('n', 'go',  vim.lsp.buf.type_definition,opts)
vim.keymap.set('n', 'gr',  vim.lsp.buf.references,    opts)
vim.keymap.set('n', '<C-s>',  vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<F2>', vim.lsp.buf.rename,        opts)
vim.keymap.set('n', 'ga', vim.lsp.buf.code_action,   opts)

vim.lsp.config("zls", {
    settings = {
        zls = {
            enable_argument_placeholders = false,
        },
    },
})

vim.lsp.config('ts_ls', {
    init_options = {
        preferences = {
            includeCompletionsForModuleExports = false,
        },
    },
})
