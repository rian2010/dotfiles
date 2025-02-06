return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional for file icons
    opts = function(_, opts)
      require('fzf-lua').setup({
        winopts = {
          height = 0.90,
          number = true,
          relativenumber = false,
          width = 0.85,
          border = "rounded",
          preview = {
            default = "bat",
            layout = "horizontal",
            border = "rounded",
            scrollbar = false,
          },
        },
        previewers = {
          bat = {
            cmd = "bat",
            args = "--style=plain --color=always --style=numbers,changes",
            theme = "gruvbox-dark",
          },
        },
        files = {
          prompt = "Files❯ ",
          git_icons = true,  -- Show git icons
          file_icons = true, -- Show file icons
        },
        grep = {
          rg_opts = "--hidden --column --line-number --no-heading " ..
              "--color=always --smart-case -g '!{.git,node_modules}/*'",
        },
      })
    end,
    config = function()
      -- Keybindings
      vim.keymap.set('n', '<C-p>', "<cmd>lua require('fzf-lua').files()<CR>", { desc = "Find Files" })
      vim.keymap.set('n', '<leader>fg', "<cmd>lua require('fzf-lua').live_grep()<CR>", { desc = "Live Grep" })
      vim.keymap.set('n', '<leader>fb', "<cmd>lua require('fzf-lua').buffers()<CR>", { desc = "Buffers" })
      vim.keymap.set('n', '<leader>fh', "<cmd>lua require('fzf-lua').help_tags()<CR>", { desc = "Help Tags" })
    end,
  }
}
