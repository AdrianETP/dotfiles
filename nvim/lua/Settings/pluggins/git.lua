return {
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add          = { text = '+' },
                change       = { text = '>' },
                delete       = { text = '-' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns


                -- Navigation
                vim.keymap.set('n', ']c', function()
                    if vim.wo.diff then return ']c' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, { expr = true })

                vim.keymap.set('n', '[c', function()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, { expr = true })

                -- Actions
                vim.keymap.set({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
                vim.keymap.set({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
                vim.keymap.set({ 'n', 'v' }, '<leader>gg', gs.diffthis)
                vim.keymap.set('n', '<leader>hS', gs.stage_buffer)
                vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk)
                vim.keymap.set('n', '<leader>hR', gs.reset_buffer)
                vim.keymap.set('n', '<leader>hp', gs.preview_hunk)
                vim.keymap.set('n', '<leader>hb', function() gs.blame_line { full = true } end)
                vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame)
                vim.keymap.set('n', '<leader>hd', gs.diffthis)
                vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end)
                vim.keymap.set('n', '<leader>td', gs.toggle_deleted)

                -- Text object
                vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
            end
        },
    },
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", ":Git<CR>")
            vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")
            vim.keymap.set("n", "<leader>gA", ":Git commit --amend<CR>")
            vim.keymap.set("n", "<leader>gP", ":Git push -u origin ")
            vim.keymap.set("n", "<leader>gp", ":Git pull<CR>")
            vim.api.nvim_create_user_command('Diff', 'Gvdiffsplit', {})
        end,
        keys = { "<leader>gs", "<leader>gc", "<leader>gA", "<leader>gP", "<leader>gp" },
        cmd = "Gvdiffsplit"
    },
}
