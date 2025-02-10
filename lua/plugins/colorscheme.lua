return {
  {
    'catppuccin/nvim',
    priority = 1000,
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'tokyonight-night'
      vim.cmd.colorscheme 'catppuccin-mocha'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'

      vim.api.nvim_set_hl(0, 'LineNr', { fg = '#7e9cd8', bg = 'NONE' })       -- Normal line numbers
      vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#e0af68', bg = 'NONE' }) -- Current line number
      vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#7e9cd8', bg = 'NONE' })  -- Line numbers above
      vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#7e9cd8', bg = 'NONE' })  -- Line numbers below
    end,
    config = function()
      require('catppuccin').setup {
        no_italic = false,
        no_bold = false,
        no_underline = true,
        flavour = 'mocha',
        term_colors = true,
        transparent_background = true,

        color_overrides = {
          mocha = {
            base = "#1e1e2e",
            mantle = "#181825",
            crust = "#11111b",
          },
        },
        integrations = {
          cmp = true,
          fzf = true,
          hop = true,
          mason = true,
          nvimtree = false,
          neotree = true,
          dashboard = false,
          dap = true,
          dap_ui = true,
          which_key = true,
          telescope = true,
        },
      }
    end,
  },

  {
    "vague2k/vague.nvim",
    config = function()
      require("vague").setup({
        -- optional configuration here
        transparent = true,
        style = {
          -- "none" is the same thing as default. But "italic" and "bold" are also valid options
          boolean = "none",
          number = "none",
          float = "none",
          error = "none",
          comments = "none",
          conditionals = "none",
          functions = "none",
          headings = "bold",
          operators = "none",
          strings = "none",
          variables = "none",

          -- keywords
          keywords = "none",
          keyword_return = "none",
          keywords_loop = "none",
          keywords_label = "none",
          keywords_exception = "none",

          -- builtin
          builtin_constants = "none",
          builtin_functions = "none",
          builtin_types = "none",
          builtin_variables = "none",
        },
        colors = {
          func = "#bc96b0",
          keyword = "#787bab",
          -- string = "#d4bd98",
          string = "#8a739a",
          -- string = "#f2e6ff",
          -- number = "#f2e6ff",
          -- string = "#d8d5b1",
          number = "#8f729e",
          -- type = "#dcaed7",
        },
      })
    end,
  },

  {
    -- lua/plugins/rose-pine.lua
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "auto",      -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true,        -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },

        groups = {
          border = "muted",
          link = "iris",
          panel = "surface",

          error = "love",
          hint = "iris",
          info = "foam",
          note = "pine",
          todo = "rose",
          warn = "gold",

          git_add = "foam",
          git_change = "rose",
          git_delete = "love",
          git_dirty = "rose",
          git_ignore = "muted",
          git_merge = "iris",
          git_rename = "pine",
          git_stage = "iris",
          git_text = "rose",
          git_untracked = "subtle",

          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",
        },

        palette = {
          -- Override the builtin palette per variant
          -- moon = {
          --     base = '#18191a',
          --     overlay = '#363738',
          -- },
        },

        highlight_groups = {
          -- Comment = { fg = "foam" },
          -- VertSplit = { fg = "muted", bg = "muted" },
        },

        before_highlight = function(group, highlight, palette)
          -- Disable all undercurls
          -- if highlight.undercurl then
          --     highlight.undercurl = false
          -- end
          --
          -- Change palette colour
          -- if highlight.fg == palette.pine then
          --     highlight.fg = palette.foam
          -- end
        end,
      })
      vim.cmd("colorscheme rose-pine")
    end
  }
}
