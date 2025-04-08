-- tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.smartindent = true

-- map leaders
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.wrap = true
vim.opt.linebreak = true

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.termguicolors = true

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
--vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 7

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.opt.confirm = true

-- [[ Basic Keymaps ]]
-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("i", "jj", "<Esc>", { desc = "press jj to escape" })

-- Emacs-equivalent navigation in insert mode
vim.keymap.set("i", "<C-n>", "<Esc>gji", { desc = "Move to next screen line", silent = true })
vim.keymap.set("i", "<C-a>", "<Esc>g0i", { desc = "Move to beginning of screen line", silent = true })
vim.keymap.set("i", "<C-e>", "<Esc>g$i", { desc = "Move to end of screen line", silent = true })
vim.keymap.set("i", "<C-p>", "<Esc>gki", { desc = "Move to previous screen line", silent = true })

-- Clear search highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Move selected lines up/down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line(s) down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line(s) up" })

-- Join lines while keeping cursor position
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines keeping cursor" })

-- Scroll while keeping cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center cursor" })

-- Paste over without affecting clipboard
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

-- Delete without affecting clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- save file
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Quick save" })

-- redo
vim.keymap.set("n", "U", "<C-r>", { desc = "redo", silent = true })

-- Quit without saving (press <Esc> three times)
vim.keymap.set("n", "<Esc><Esc><Esc>", ":q!<CR>", { desc = "Force quit without saving", silent = true })

-- Splits
vim.keymap.set("n", "<C-t>v", ":vsplit<CR>", { desc = "Open vertical split", silent = true })
vim.keymap.set("n", "<C-t>h", ":split<CR>", { desc = "Open horizontal split", silent = true })
vim.keymap.set("n", "<C-t>q", ":close<CR>", { desc = "Close split", silent = true })
vim.keymap.set("n", "<C-q>", ":close<CR>", { desc = "Close split", silent = true })
vim.keymap.set("n", "<C-x>", ":q!<CR>", { desc = "Force close split", silent = true })

-- Navigate between splits using Ctrl + Arrow keys
vim.keymap.set("n", "<C-t><Left>", "<C-w>h", { desc = "Move to left split", silent = true })
vim.keymap.set("n", "<C-t><Right>", "<C-w>l", { desc = "Move to right split", silent = true })
vim.keymap.set("n", "<C-t><Up>", "<C-w>k", { desc = "Move to upper split", silent = true })
vim.keymap.set("n", "<C-t><Down>", "<C-w>j", { desc = "Move to lower split", silent = true })

-- File history navigation
vim.keymap.set("n", "<C-o>", "<C-o>", { desc = "Go to previous edited file", silent = true })
vim.keymap.set("n", "<C-i>", "<C-i>", { desc = "Go to next edited file", silent = true })
vim.keymap.set("n", "<C-p>", "<C-^>", { desc = "Alternate between current and previous file", silent = true })

-- Tabs
vim.keymap.set("n", "<C-t>t", ":tabnew<CR>", { desc = "Open new tab", silent = true })
vim.keymap.set("n", "<C-t>n", ":tabnext<CR>", { desc = "Go to next tab", silent = true })
vim.keymap.set("n", "<C-t>p", ":tabprevious<CR>", { desc = "Go to previous tab", silent = true })
vim.keymap.set("n", "<C-t>c", ":tabclose<CR>", { desc = "Close current tab", silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 10)
end)

-- [[ Basic Autocommands ]]
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require("lazy").setup({
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				filetype = { "lua" },
			})
			lspconfig.pyright.setup({
				filetype = { "py" },
			})
			lspconfig.clangd.setup({
				filetype = { "c", "cpp" },
			})
			lspconfig.zls.setup({
				filetype = { "zig" },
			})
		end,
	},
	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		end,
	},
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = {
			keymap = { preset = "default" },

			appearance = {
				nerd_font_variant = "mono",
			},
			completion = { documentation = { auto_show = false } },
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	{ -- You can easily change to a different colorscheme.
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
	},
	{
		"sainnhe/gruvbox-material",
		name = "gruvbox-material",
	},
	{
		"ribru17/bamboo.nvim",
		name = "bamboo",
	},
	{
		"neanias/everforest-nvim",
		name = "everforest",
	},
	{
		"sainnhe/sonokai",
		name = "sonokai",
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			require("mini.comment").setup()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup()
			require("mini.pairs").setup()

			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })
		end,
	},
	{
		"nvim-neorg/neorg",
		lazy = false,
		ft = { "norg" },
		version = "*",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {},
					["core.itero"] = {},
					["core.promo"] = {},
				},
			})
			vim.wo.foldlevel = 1
			vim.wo.conceallevel = 2
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					c = { "clang-format" },
					cpp = { "clang-format" },
				},
			})
		end,
	},
	{
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		ft = { "org" },
		config = function()
			require("orgmode").setup({})
		end,
	},
	{
		"akinsho/org-bullets.nvim",
		config = function()
			require("org-bullets").setup()
		end,
	},
	-- Lua
	{
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup()
		end,
	},
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
				"norg",
				"python",
				"cpp",
				"fortran",
			},
			-- Autoinstall languages that are not installed
			auto_install = true,
		},
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		end,
	},
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
		end,
	},
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
		},
	},
})

-- neovide configuration
if vim.g.neovide then
	vim.g.guifont = "JetBrains Mono:h12"
	vim.g.neovide_position_animation_length = 0
	vim.g.neovide_scroll_animation_length = 0.0
	vim.g.neovide_cursor_animation_length = 0.0
	vim.g.neovide_cursor_animate_in_insert_mode = false
	vim.g.neovide_cursor_smooth_blink = false
	vim.g.neovide_cursor_vfx_mode = ""
	vim.g.neovide_cursor_vfx_mode = { "", "" }

	vim.g.neovide_padding_top = 0
	vim.g.neovide_padding_bottom = 0
	vim.g.neovide_padding_right = 0
	vim.g.neovide_padding_left = 0
	vim.g.neovide_scale_factor = 1.0
	vim.g.neovide_text_gamma = 0.0
	vim.g.neovide_text_contrast = 0.5
end

-- floating terminal
-- by TJ DeVries
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local state = {
	floating = {
		buf = -1,
		win = -1,
	},
}

local function create_floating_window(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)

	-- Calculate the position to center the window
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	-- Create a buffer
	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
	end

	-- Define window configuration
	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal", -- No borders or extra UI elements
		border = "rounded",
	}

	-- Create the floating window
	local win = vim.api.nvim_open_win(buf, true, win_config)

	return { buf = buf, win = win }
end

local toggle_terminal = function()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = create_floating_window({ buf = state.floating.buf })
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end

-- Example usage:
-- Create a floating window with default dimensions
vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})
vim.keymap.set({ "n", "t" }, "<leader>tt", toggle_terminal)

-- load colorscheme
vim.cmd.colorscheme("everforest")
