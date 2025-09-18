vim.opt.signcolumn = "yes"
vim.wo.signcolumn = "yes"
print("signcolumn is now set to:", vim.o.signcolumn)
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.o.showtabline = 2

--vim.api.nvim_create_autocmd("BufWinEnter", {
  --callback = function()
    --vim.wo.signcolumn = "yes"
  --end,
--})


vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.g.mapleader = " "

vim.opt.clipboard = 'unnamedplus'

vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufWinEnter", "BufEnter" }, {
  group = vim.api.nvim_create_augroup("ForceSignColumn", { clear = true }),
  callback = function()
    vim.schedule(function()
      vim.wo.signcolumn = "yes"
    end)
  end,
})
