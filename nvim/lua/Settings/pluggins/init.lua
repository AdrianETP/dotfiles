return {
    {
        'm4xshen/autoclose.nvim',
        config = function()
            require('autoclose').setup()
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
            "kristijanhusak/vim-dadbod-completion"

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
    }
}
