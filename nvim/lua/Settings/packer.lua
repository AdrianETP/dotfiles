-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Telescope (fuzzy finder)
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { "thePrimeagen/harpoon", requires = 'nvim-lua/plenary.nvim' }


    -- lsp zero
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }
    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter"
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    use "HiPhish/nvim-ts-rainbow2"

    use "windwp/nvim-ts-autotag"

    -- autoclose
    use 'm4xshen/autoclose.nvim'

    -- vim-tmux-navigator
    -- use 'christoomey/vim-tmux-navigator'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    }
    -- git plugins
    use("tpope/vim-fugitive")
    use("lewis6991/gitsigns.nvim")

    -- database plugins (dadbod)
    use "tpope/vim-dadbod"
    use "kristijanhusak/vim-dadbod-ui"
    -- themes
    -- Tokyo night
    use 'folke/tokyonight.nvim'
    -- github
    use({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })

    -- onedark
    use 'navarasu/onedark.nvim'
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    -- vscode
    use 'Mofiqul/vscode.nvim'

    -- codium (AI Autocompletion)
    use "Exafunction/codeium.vim"

    -- bufferline
    use "akinsho/bufferline.nvim"
end)
