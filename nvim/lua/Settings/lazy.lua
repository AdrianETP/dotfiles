-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Only required if you have packer configured as `opt`

return require('lazy').setup({
    {
        "nvim-telescope/telescope-file-browser.nvim",
        keys = "<leader>pv"

    },
    -- Telescope (fuzzy finder)
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' },

        },
        config = function()
            local telescope = require("telescope")
            local fb_actions = require("telescope").extensions.file_browser.actions
            telescope.setup({
                defaults = {
                    -- Default configuration for telescope goes here:
                    -- config_key = value,
                    mappings = {
                        i = {
                            -- map actions.which_key to <C-h> (default: <C-/>)
                            -- actions.which_key shows the mappings for your picker,
                            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                            ["<C-h>"] = "which_key"
                        },
                        n = {
                            ["q"] = "close"
                        }
                    }
                },
                pickers = {
                    find_files = {
                        prompt_prefix = " "
                    },
                    lsp_references = {
                        theme = "cursor",
                        initial_mode = "normal"
                    },
                    buffers = {
                        prompt_prefix = " "
                    },
                    git_files = {
                        prompt_prefix = " ",
                    },
                    git_commits = {
                        prompt_prefix = " "
                    },
                    git_branches = {
                        prompt_prefix = " "
                    },
                    colorscheme = {
                        theme = "dropdown",
                        previewer = false
                    }
                    -- Default configuration for builtin pickers goes here:
                    -- picker_name = {
                    --   picker_config_key = value,
                    --   ...
                    -- }
                    -- Now the picker_config_key will be applied every time you call this
                    -- builtin picker
                },
                extensions = {
                    file_browser = {
                        -- disables netrw and use telescope-file-browser in its place
                        hijack_netrw = true,
                        previewer = false,
                        initial_mode = "normal",
                        mappings = {
                            ["i"] = {
                                -- your custom insert mode mappings
                            },
                            ["n"] = {
                                -- your custom normal mode mappings
                                ["-"] = fb_actions.goto_parent_dir
                            },
                        },
                    },
                }
            })

            local builtin = require('telescope.builtin')
            require("telescope").load_extension "file_browser"
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>pc', builtin.colorscheme, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>lj', builtin.jumplist, {})
            vim.keymap.set('n', '<leader>lc', builtin.git_commits, {})
            vim.keymap.set('n', '<leader>lb', builtin.git_branches, {})
            vim.keymap.set('n', '<leader>ld', builtin.diagnostics, {})
            -- open file_browser with the path of the current buffer
            vim.api.nvim_set_keymap(
                "n",
                "<space>pv",
                "<Cmd>Telescope file_browser path=%:p:h<CR>",
                { noremap = true }
            )
        end,
        keys = {
            '<leader>pf',
            '<leader>pg',
            '<leader>pb',
            '<leader>ph',
            '<leader>pc',
            '<C-p>',
            '<leader>lj',
            '<leader>lc',
            '<leader>lb',
            '<leader>ld',
        }

    },
    -- packer

    --   { "thePrimeagen/harpoon", dependencies = 'nvim-lua/plenary.nvim' }


    -- lsp zero
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
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
            { 'hrsh7th/cmp-buffer' },   -- Optional
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        },
        config = function()
            local lsp = require('lsp-zero').preset({})
            local cmp = require("cmp")

            lsp.on_attach(function(_, bufnr)
                lsp.default_keymaps({ buffer = bufnr })
                vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>")
                vim.keymap.set("n", "<leader>lf", function()
                    vim.lsp.buf.format()
                end)
                vim.keymap.set("n", "<leader>a", function()
                    vim.lsp.buf.code_action()
                end)
                vim.keymap.set("n", "<leader>rn", function()
                    vim.lsp.buf.rename()
                end)
            end)


            -- (Optional) Configure lua language server for neovim
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

            cmp.setup({
                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), },
                window = {
                    completion = cmp.config.window.bordered(),
                },
            }

            )

            lsp.setup()
        end
    },
    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {

            'nvim-treesitter/nvim-treesitter-context',
            "HiPhish/nvim-ts-rainbow2",

            "windwp/nvim-ts-autotag",

            -- autoclose
            'm4xshen/autoclose.nvim',
        }

    },

    -- vim-tmux-navigator
    --  'christoomey/vim-tmux-navigator'
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    },
    -- git plugins

    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", ":Git<CR>")
            vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")
            vim.keymap.set("n", "<leader>gA", ":Git commit --amend<CR>")
            vim.keymap.set("n", "<leader>gP", ":Git push -u origin ")
            vim.keymap.set("n", "<leader>gp", ":Git pull<CR>")
        end,
        keys = { "<leader>gs", "<leader>gc"  , "<leader>gA", "<leader>gP", "<leader>gp"}
    },
    "lewis6991/gitsigns.nvim",

    -- database plugins (dadbod)
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = {
            "tpope/vim-dadbod",

        },
        config = function()
            vim.keymap.set("n", "<leader>db", function()
                vim.cmd("enew")
                vim.cmd("DBUI")
            end)

            vim.g.db_ui_save_location = '~/Desktop'
        end,
        keys = "<leader>db"
    },
    -- themes
    -- Tokyo night
    --      'folke/tokyonight.nvim'
    -- github
    --     ({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })

    -- onedark
    'navarasu/onedark.nvim',
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
        keys = { "gcc", "gbb", "gc", "gb" }
    },
    -- vscode
    --    'Mofiqul/vscode.nvim'

    -- nord
    --  'shaunsingh/nord.nvim'

    -- codium (AI Autocompletion)
    --  "Exafunction/codeium.vim"

    -- bufferline
    "akinsho/bufferline.nvim",

    -- colorizer (for tailwind)
    'NvChad/nvim-colorizer.lua',


    -- noice
    {
        "folke/noice.nvim",
        config = function()
            require("noice").setup({
                -- add any options here
            })
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },
})
