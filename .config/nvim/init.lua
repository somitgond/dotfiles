-- init.lua
vim.g.mapleader = " "  -- Sets the leader key to space

-- Enable line numbering
vim.wo.number = true
-- vim.wo.relativenumber = true
-- vim.wo.colorcolumn = '80'

-- Optimize for faster terminal
vim.o.ttyfast = true

-- Disable Vim compatibility for a more modern experience
vim.o.compatible = false

-- Configure line wrapping and cursor
vim.wo.wrap = true
--vim.o.guicursor = "a:block"

-- Encoding and case sensitivity
vim.o.encoding = "utf-8"
-- vim.o.ignorecase = true

-- Indentation settings
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.autoindent = true

-- Mouse support
vim.o.mouse = "a"

-- Clipboard settings (no clipboard integration)
vim.o.clipboard = unnamedplus 

-- Performance optimizations
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.lazyredraw = true

-- Wildmenu settings for command-line completion
vim.o.wildmode = "longest,list"

-- set colorscheme
vim.cmd [[
  syntax off 
  colorscheme retrobox 
  autocmd TextChanged,TextChangedI *.md silent write
]]


-- no continuous update of cursor position
vim.opt.ruler = false

-- enable autoread
--vim.o.autoread = true

-- keyboard shortcut to compile and run the cp programs

local function compile_and_run_cpp()
  local filename = vim.fn.expand('%')
  local output_name = vim.fn.expand('%:r')
  local input_file = "inputf.in"
  local output_file = "outputf.in"
  vim.cmd('wa')
  local command = string.format(
    'g++ -std=c++23 %s -o %s -Wall && timeout 4s ./%s<%s>%s',
    filename, output_name, output_name, input_file, output_file
  )
  local output = vim.fn.system(command)
  vim.notify(output, vim.log.levels.INFO, { title = "Compile and Run Output" })
  -- reload the changed files
  vim.cmd('checktime')
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.keymap.set('n', '<Leader>r', compile_and_run_cpp, { noremap = true, silent = true })
  end
})


