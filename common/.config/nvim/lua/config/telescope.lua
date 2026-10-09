local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Telescope old files' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope diagnostics' })

vim.keymap.set('n', '<leader>ft', builtin.builtin, { desc = 'Telescope builtins' })

vim.keymap.set('n', '<leader>df', function()
    builtin.find_files({
        prompt_title = "Find Dotfiles",
        hidden = true,
        no_ignore = true,  -- include files ignored by .gitignore, optional
    })
end)
