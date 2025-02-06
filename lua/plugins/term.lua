return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        -- Configuration options
        size = 15,                -- Height of the terminal in horizontal split, or width in vertical split
        open_mapping = [[<C-j>]], -- Keybinding to toggle the terminal
        hide_numbers = true,      -- Hide line numbers in the terminal
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,     -- Degree of shading (1 = light, 3 = dark)
        start_in_insert = true, -- Start in insert mode
        persist_size = true,    -- Remember terminal size
        direction = "float",    -- Options: 'horizontal', 'vertical', 'tab', 'float'
        close_on_exit = true,   -- Close the terminal when the process exits
        shell = "pwsh.exe",     -- Use the default shell
        float_opts = {
          border = "curved",    -- Border style for floating terminals ('single', 'double', 'curved', etc.)
          winblend = 0,         -- Transparency level (0 = opaque, 100 = fully transparent)
          heights = 20,
          width = 120,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })

      -- Example: Set up a terminal for lazygit
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = true,
        direction = "float",
      })

      function _lazygit_toggle()
        lazygit:toggle()
      end

      -- Keybinding for lazygit
      vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
    end,
  },
}
