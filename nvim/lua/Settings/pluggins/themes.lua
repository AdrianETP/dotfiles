return {

    {
        'projekt0n/github-nvim-theme',
        tag = 'v0.0.7',
        -- config = function()
        --     vim.cmd('colorscheme github_dimmed')
        -- end
    },

    -- onedark
    {
        "navarasu/onedark.nvim",
        config = function()
            require('onedark').setup {
                style = 'cool'
            }
            --vim.cmd('colorscheme onedark')
        end
    },
    -- vscode
    'Mofiqul/vscode.nvim',


    -- tokyo night
    {
        'folke/tokyonight.nvim',
        -- config = function() vim.cmd('colorscheme tokyonight') end,
    },
    {
        'Mofiqul/dracula.nvim',
        config = function()
            vim.cmd('colorscheme dracula')
        end
    },
    -- nord
    {
        'shaunsingh/nord.nvim',
        --[[ config = function()
            vim.cmd('colorscheme nord')
        end ]]

    },

}
