local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})

vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

vim.keymap.set('n', '<leader>df', function()
    builtin.find_files({
        prompt_title = "< Find Dotfiles >",
        hidden = true,
        no_ignore = true,  -- include files ignored by .gitignore, optional
    })
end)
