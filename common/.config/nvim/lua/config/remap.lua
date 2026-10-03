vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bnext<CR>")

-- Escape the terminal!
vim.keymap.set("t", "<Escape>", "<C-\\><C-n><C-w>h", {silent = true})

vim.keymap.set({"n", "x"}, "j", "gj")
vim.keymap.set({"n", "x"}, "k", "gk")

vim.keymap.set("n", "<leader>t", ":terminal ")
