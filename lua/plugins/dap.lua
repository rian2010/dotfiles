return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "leoluz/nvim-dap-go",
      "theHamsta/nvim-dap-virtual-text",

    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("dapui").setup()
      require("dap-go").setup()


      -- Set up dap-ui
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- Keymaps
      vim.keymap.set('n', '<leader>df', dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = "Continue Execution" })
    end,
  }
}
