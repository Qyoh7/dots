-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'morhetz/gruvbox',
        config = function() vim.cmd.colorscheme("gruvbox") end 
    }

    use {'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}}
    use ('theprimeagen/harpoon')
    use ('mbbill/undotree')
    use ('tpope/vim-fugitive')

    use ('subnut/nvim-ghost.nvim')
    

    use ('neovim/nvim-lspconfig')
    use ("williamboman/mason.nvim")
    use ('williamboman/mason-lspconfig.nvim')
    use ('hrsh7th/nvim-cmp')
    use ('hrsh7th/cmp-nvim-lsp')
    use ('L3MON4D3/LuaSnip')

    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
end)
