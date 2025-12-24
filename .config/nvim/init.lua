-- Basic UI
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic settings
vim.opt.number = true                              -- Line numbers
vim.opt.relativenumber = true                      -- Relative line numbers
vim.opt.cursorline = true                          -- Highlight current line
vim.opt.scrolloff = 10                             -- Keep 10 lines above/below cursor 
vim.opt.sidescrolloff = 8                          -- Keep 8 columns left/right of cursor
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")
vim.opt.wrap = false

-- Indentation
vim.opt.tabstop = 2                                -- Tab width
vim.opt.shiftwidth = 2                             -- Indent width
vim.opt.softtabstop = 2                            -- Soft tab stop
vim.opt.expandtab = true                           -- Use spaces instead of tabs
vim.opt.smartindent = true                         -- Smart auto-indenting
vim.opt.autoindent = true                          -- Copy indent from current line

-- Search settings
vim.opt.smartcase = true                           -- Case sensitive if uppercase in search
vim.opt.incsearch = true                           -- Show matches as you type

-- Visual settings
vim.opt.termguicolors = true                       -- Enable 24-bit colors
vim.opt.colorcolumn = "100"                        -- Show column at 100 characters
vim.cmd.colorscheme "unokai"

vim.pack.add{
    "https://github.com/nvim-orgmode/orgmode";
    "https://github.com/nvim-orgmode/org-bullets.nvim";
    "https://github.com/nvim-mini/mini.nvim";
}

-- Your orgmode setup
require('orgmode').setup()

--Setup org-bullets
require('org-bullets').setup()

require('mini.notify').setup()
require('mini.icons').setup()
require('mini.statusline').setup()

-- Safely execute later
require('mini.ai').setup()
require('mini.comment').setup()
require('mini.pick').setup()
require('mini.surround').setup()

