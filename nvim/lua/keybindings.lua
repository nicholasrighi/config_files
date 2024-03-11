local M = {}

function M.post_setup()
	-- Reamp leader to space
	vim.g.mapleader = " "

	-- Remap opening new pane
	vim.keymap.set('n', '<C-w>s', '<C-w><C-s>', { desc = 'Split window horizontally' })
	vim.keymap.set('n', '<C-w>d', '<C-w><C-v>', { desc = 'Split window vertically' })

	-- Remap pane focusing 
	vim.keymap.set('n', '<C-w>h', '<C-w><C-h>', { desc = 'Move focus to the left window' })
	vim.keymap.set('n', '<C-w>l', '<C-w><C-l>', { desc = 'Move focus to the right window' })
	vim.keymap.set('n', '<C-w>j', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
	vim.keymap.set('n', '<C-w>k', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

	-- Make line numbers default
	vim.opt.number = true

	-- Enable mouse mode, can be useful for resizing splits for example!
	vim.opt.mouse = 'a'

	-- Don't show the mode, since it's already in status line
	vim.opt.showmode = false

	-- Sync clipboard between OS and Neovim.
	--  Remove this option if you want your OS clipboard to remain independent.
	--  See `:help 'clipboard'`
	vim.opt.clipboard = 'unnamedplus'

	-- Enable break indent
	vim.opt.breakindent = true

	-- Save undo history
	vim.opt.undofile = true

	-- Case-insensitive searching UNLESS \C or capital in search
	vim.opt.ignorecase = true
	vim.opt.smartcase = true

	-- Keep signcolumn on by default
	vim.opt.signcolumn = 'yes'

	-- Decrease update time
	vim.opt.updatetime = 250
	vim.opt.timeoutlen = 300

	-- Configure how new splits should be opened
	vim.opt.splitright = true
	vim.opt.splitbelow = true

	-- Sets how neovim will display certain whitespace in the editor.
	--  See `:help 'list'`
	--  and `:help 'listchars'`
	vim.opt.list = true
	vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

	-- Preview substitutions live, as you type!
	vim.opt.inccommand = 'split'

	-- Minimal number of screen lines to keep above and below the cursor.
	vim.opt.scrolloff = 10

	-- Set highlight on search, but clear on pressing <Esc> in normal mode
	vim.opt.hlsearch = true
	vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

	-- Highlight when yanking (copying) text
	--  Try it with `yap` in normal mode
	--  See `:help vim.highlight.on_yank()`
	vim.api.nvim_create_autocmd('TextYankPost', {
	  desc = 'Highlight when yanking (copying) text',
	  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	  callback = function()
	    vim.highlight.on_yank()
	  end,
	})
end

function M.setup()
	return {}
end

return M
