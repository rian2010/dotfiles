return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local icon = require("elzbth.icon")

    local mode = "mode"
    local location = "location"

    local filetype = { "filetype", icon_only = true, }
    local filename = { "filename", padding = 0 }

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn", "info", "hint" },
      symbols = {
        error = icon.diagnostics.Error,
        hint = icon.diagnostics.Hint,
        info = icon.diagnostics.Info,
        warn = icon.diagnostics.Warning,
      },
      colored = true,
      update_in_insert = false,
      always_visible = false,
    }

    local diff = {
      "diff",
      source = function()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
          }
        end
      end,
      symbols = {
        added = icon.git.LineAdded .. " ",
        modified = icon.git.LineModified .. " ",
        removed = icon.git.LineRemoved .. " ",
      },
      colored = true,
      always_visible = false,
    }

    local file_status = {
      "filestatus",
      symbols = {
        modified = "[+]",
        readonly = "[-]",
      },
    }

    local active_lsp = {
      function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
        local clients = vim.lsp.get_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end,
      icon = ' LSP:',
      color = { fg = '#ffffff', gui = 'bold' },
    }

    require("lualine").setup({
      options = {
        theme = "auto",
        component_separators = "", -- Remove component separators
        section_separators = "",   -- Remove section separators
      },
      sections = {
        lualine_a = { mode },
        lualine_b = {},
        lualine_c = { { 'b:gitsigns_head', icon = '' }, filetype, filename, file_status, },
        lualine_x = { diff },
        lualine_y = { diagnostics, },
        lualine_z = { location },
      }
    })
  end,
}
