return {
    {
        "mfussenegger/nvim-dap"
    },

    {
        "rcarriga/nvim-dap-ui",

        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
            vim.keymap.set('n' , '<leader>bb','<Cmd>DapToggleBreakpoint<CR>')
            vim.keymap.set('n' , '<leader>bc','<Cmd>DapContinue<CR>')
            vim.keymap.set('n' , '<leader>bl','<Cmd>DapStepInto<CR>')
            vim.keymap.set('n' , '<leader>bh','<Cmd>DapStepOver<CR>')
            vim.keymap.set('n', '<leader>bq', '<Cmd>DapTerminate<CR>')

        end

    },
    {
        "mfussenegger/nvim-dap-python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "mfussenegger/nvim-dap",
        },
        ft = "python",

        config = function()
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
        end
    }
}
