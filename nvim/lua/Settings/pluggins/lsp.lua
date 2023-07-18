return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' }, -- Required
        {
            -- Optional
            'williamboman/mason.nvim',
            config = function()
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
}
