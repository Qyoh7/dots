require('nvim-treesitter').setup {

  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}
require('nvim-treesitter').install { 'lua', 'cpp', 'c' }

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
      local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
      if lang and vim.treesitter.language.add(lang) then
          vim.treesitter.start()
      end
  end,
})
