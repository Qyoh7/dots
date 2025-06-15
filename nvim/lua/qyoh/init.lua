require("qyoh.remap")
require("qyoh.set")
require("qyoh.packer")
require("qyoh.lsp")
require("qyoh.java")

vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "signcolumn",
  callback = function()
    print("signcolumn was changed to:", vim.o.signcolumn)
  end,
})
