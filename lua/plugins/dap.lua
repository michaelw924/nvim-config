return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "mfussenegger/nvim-dap-python",
            "nvim-neotest/nvim-nio",
        },

        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            local dap_python = require("dap-python")
            vim.fn.sign_define('DapBreakpoint', {
              text='🛑',
              texthl='',
              linehl='',
              numhl=''
            })

            dapui.setup()

            dap_python.setup("python")

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end

            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end

            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            vim.keymap.set("n", "<F5>", dap.continue)
            vim.keymap.set("n", "<F6>", dap.step_over)
            vim.keymap.set("n", "<F7>", dap.step_into)
            vim.keymap.set("n", "<F8>", dap.step_out)


            vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
        end,
    },
}
