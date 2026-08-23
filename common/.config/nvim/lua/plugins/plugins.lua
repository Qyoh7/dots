return {
    {
        "ellisonleao/gruvbox.nvim",
        config = function() vim.cmd.colorscheme("gruvbox") end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        branch = "main",
        build = ':TSUpdate',
        config = function()
            require("config.treesitter")
        end

    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("config.harpoon")
        end,
    },
    {
        "toppair/peek.nvim",
        event = { "VeryLazy" },
        build = "deno task --quiet build:fast",
        config = function()
            require("config.peek")
        end,

    },
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    { 
        "neovim/nvim-lspconfig",
        config = function()
            vim.keymap.set('n', 'K',   vim.lsp.buf.hover,         opts)
            vim.keymap.set('n', 'gd',  vim.lsp.buf.definition,    opts)
            vim.keymap.set('n', 'gD',  vim.lsp.buf.declaration,   opts)
            vim.keymap.set('n', 'gi',  vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', 'go',  vim.lsp.buf.type_definition,opts)
            vim.keymap.set('n', 'gr',  vim.lsp.buf.references,    opts)
            vim.keymap.set('n', 'gs',  vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<F2>', vim.lsp.buf.rename,        opts)
            vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action,   opts)
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                "clangd",
                "lua_ls",
                -- "jdtls",
            },
            automatic_enable = true,
        },
    },
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function()
            require("config.telescope")
        end
    },
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = 'enter' },

            appearance = {
                nerd_font_variant = 'mono'
            },

            completion = { documentation = { auto_show = false } },
            fuzzy = { implementation = "prefer_rust_with_warning" },
            signature = { enabled = true }
        },
        opts_extend = { "sources.default" }
    },
    {

        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        end
    },
    {
        'echasnovski/mini.nvim',
        config = function()
            require("config.mini")
        end
    },
    {
        "tpope/vim-vinegar",
    }
}
