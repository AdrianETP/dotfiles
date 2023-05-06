local telescope = require("telescope")
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
            theme = "dropdown",
            previewer = false,
        },
        git_commits = {
            prompt_prefix = " "
        },
        git_branches = {
            prompt_prefix = " "
        },
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pc', builtin.colorscheme, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>lc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>lb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>ld', builtin.diagnostics, {})
