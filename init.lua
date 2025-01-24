vim.o.termguicolors = true

local keymap = vim.keymap

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


vim.g.mapleader = " "

require("lazy").setup({
  spec = {
    { import = "plugins" }
  },
  ui = {
    border = "rounded",
    size = {
      width = 0.8,
      height = 0.8,
    },
  },
  icons = {
    cmd = " ",
    config = "",
    debug = "● ",
    event = " ",
    favorite = " ",
    ft = " ",
    init = " ",
    import = " ",
    keys = " ",
    lazy = "󰒲 ",
    loaded = "●",
    not_loaded = "○",
    plugin = " ",
    runtime = " ",
    require = "󰢱 ",
    source = " ",
    start = " ",
    task = "✔ ",
    list = {
      "●",
      "➜",
      "★",
      "‒",
    },
  },
})

vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.number = true


-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
}


-- Use spaces instead of tabs
vim.opt.expandtab = true
-- Number of spaces a tab character occupies
vim.opt.tabstop = 2
-- Number of spaces for each indentation level
vim.opt.shiftwidth = 2
-- Enable auto-indentation
vim.opt.autoindent = true
vim.keymap.set("n", "<C-e>", vim.cmd.Ex)
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- tiling windows keymaps
vim.keymap.set("n", "ss", ":split<Return>", opts)
vim.keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Changing the default terminal into pwsh

-- Diagnostic Keymaps
--vim.keymap.set("n", "<leader>q", vim.diagnotstic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
--
vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"
