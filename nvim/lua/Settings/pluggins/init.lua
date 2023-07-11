return {
    -- Telescope (fuzzy finder)

    --[[ {
        "thePrimeagen/harpoon",
        dependencies = 'nvim-lua/plenary.nvim',
        keys = {
            '<leader>m',
            '<C-y>',
            '<C-t>',
            '<C-n>',
            '<C-s>',
            '<C-e>'
        },
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")
            vim.keymap.set("n", "<leader>m", function() mark.add_file() end)
            vim.keymap.set("n", "<C-e>", function() ui.toggle_quick_menu() end)
            vim.keymap.set("n", "<C-y>", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
            vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
            vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
        end


    }, ]]


    -- lsp zero
    -- treesitter
    {
        'm4xshen/autoclose.nvim',
        config = function()
            require('autoclose').setup()
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        dependencies = {
            'nvim-treesitter/nvim-treesitter-context',
            "HiPhish/nvim-ts-rainbow2",
        },
        config = function()
            require 'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                -- List of parsers to ignore installing (for "all")
                ignore_install = { "javascript" },

                ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
                -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

                highlight = {
                    enable = true,
                    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                    -- the name of the parser)
                    -- list of language that will be disabled
                    --    disable = { "c", "rust" },
                    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
                rainbow = {
                    enable = true,
                },
                autotag = {
                    enable = true,
                }
            }

            require 'treesitter-context'.setup {
                enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
                max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
                trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
                zindex = 20, -- The Z-index of the context window
            }
        end

    },
    {
        "windwp/nvim-ts-autotag",
        ft = { "html", "typescript", "typescriptreact", "javascript", "javascriptreact" }
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup()
        end
    },
    -- git plugins


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
    -- comment nvim
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
    },
    -- themes
    -- github




    -- colorizer (for tailwind)
    {
        'NvChad/nvim-colorizer.lua',
        ft = { "typescriptreact", "astro", "javascriptreact", "javascript", "typescript", "css" },
        opts = {
            filetypes = { "*" },
            user_default_options = {
                RGB = true,          -- #RGB hex codes
                RRGGBB = true,       -- #RRGGBB hex codes
                names = true,        -- "Name" codes like Blue or blue
                RRGGBBAA = false,    -- #RRGGBBAA hex codes
                AARRGGBB = false,    -- 0xAARRGGBB hex codes
                rgb_fn = false,      -- CSS rgb() and rgba() functions
                hsl_fn = false,      -- CSS hsl() and hsla() functions
                css = false,         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = false,      -- Enable all CSS *functions*: rgb_fn, hsl_fn
                -- Available modes for `mode`: foreground, background,  virtualtext
                mode = "background", -- Set the display mode.
                -- Available methods are false / true / "normal" / "lsp" / "both"
                -- True is same as normal
                tailwind = true,                                 -- Enable tailwind colors
                -- parsers can contain values used in |user_default_options|
                sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
                virtualtext = "■",
                -- update color values even if buffer is not focused
                -- example use: cmp_menu, cmp_docs
                always_update = true
            },
            -- all the sub-options of filetypes apply to buftypes
            buftypes = {},
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require "nvim-tree".setup()
            vim.keymap.set("n", "<leader>pv","<Cmd>NvimTreeToggle<CR>")
        end,
        keys="<leader>pv"
    }


}
