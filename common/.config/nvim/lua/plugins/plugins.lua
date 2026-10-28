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
            require("config.lsp")
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
        "NeogitOrg/neogit",
        lazy = true,
        dependencies = {
            "sindrets/diffview.nvim",        -- optional
            -- For a custom log pager
            "m00qek/baleia.nvim",            -- optional
        },
        cmd = "Neogit",
        keys = {
            { "<leader>gs", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
        },
        config = function ()
            require("config.neogit")
        end
    },
    {
        'echasnovski/mini.nvim',
        config = function()
            require("config.mini")
        end
    },
    {
        "X3eRo0/dired.nvim",
        dependencies = "MunifTanjim/nui.nvim",
        config = function()
            require("dired").setup {
        --         path_separator = "/",
        --         show_banner = false,
        --         show_icons = false,
        --         show_hidden = true,
        --         show_dot_dirs = true,
        --         show_colors = true,
            }
            vim.keymap.set("n", "<leader>e", "<cmd>Dired<cr>")
        end
    }
}
