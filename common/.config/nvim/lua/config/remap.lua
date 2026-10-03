vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bnext<CR>")

-- Escape the terminal!
vim.keymap.set("t", "<Escape>", "<C-\\><C-n><C-w>h", {silent = true})

vim.keymap.set("n", "<leader>t", function ()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[buf].buftype == "terminal" then
            vim.api.nvim_set_current_buf(buf)
            return
        end
    end

    vim.cmd("terminal")
end)

vim.keymap.set({"n", "x"}, "<C-;>", "q:", {silent = true})

vim.keymap.set({"n", "x"}, "j", "gj")
vim.keymap.set({"n", "x"}, "k", "gk")
