-- Global diagnostics mappings
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = "Open diagnostic info" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

-- LSP attach callback: buffer-local mappings
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local bufnr = event.buf
    local opts  = { buffer = bufnr }

    vim.keymap.set('n', 'K',   vim.lsp.buf.hover,         opts)
    vim.keymap.set('n', 'gd',  vim.lsp.buf.definition,    opts)
    vim.keymap.set('n', 'gD',  vim.lsp.buf.declaration,   opts)
    vim.keymap.set('n', 'gi',  vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'go',  vim.lsp.buf.type_definition,opts)
    vim.keymap.set('n', 'gr',  vim.lsp.buf.references,    opts)
    vim.keymap.set('n', 'gs',  vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename,        opts)
    vim.keymap.set({'n','x'}, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
    vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action,   opts)
  end,
})

-- Setup Mason & Mason-LSPconfig to ensure servers installed
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "pyright", "jdtls" },
})


-- blink.cmp setup (replacing nvim-cmp)
require('blink.cmp').setup({
  -- keymap presets, snippet support, etc.
  snippets = {
    -- if using LuaSnip
    preset = "luasnip",
  },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "mono",
  },
  -- Optionally enable cmdline completions
  cmdline = {
    enabled = true,
    -- config, e.g., for ":" and "/" search
    functions = {
      type = vim.fn.getcmdtype,
    },
  },
})

