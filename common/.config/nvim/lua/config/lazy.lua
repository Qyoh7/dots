-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { "ellisonleao/gruvbox.nvim", config = function() vim.cmd.colorscheme("gruvbox") end },
        { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", },
        { 'nvim-lua/plenary.nvim'},

        { "theprimeagen/harpoon" },
        { "tpope/vim-fugitive", config = function() vim.keymap.set("n", "<leader>gs", vim.cmd.Git) end },
        { "subnut/nvim-ghost.nvim" },

        {
            "toppair/peek.nvim",
            event = { "VeryLazy" },
            build = "deno task --quiet build:fast",
            config = function()
                require("peek").setup()
                vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
                vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
            end,
        },
        {
            "stevearc/oil.nvim", config = function() require("oil").setup() 
                vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
            end
        },

        { "williamboman/mason.nvim" },
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason-lspconfig.nvim" },
        { "L3MON4D3/LuaSnip" },

        { import = "config.plugins" },
    },
})
