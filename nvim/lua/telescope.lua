
local M = {}

function M.post_setup()
	local mappings = require("telescope.mappings")
	local actions = require("telescope.actions")
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>dd', builtin.find_files, {})
	vim.keymap.set('n', '<leader>df', builtin.live_grep, {})
	vim.keymap.set('n', '<leader>dh', builtin.help_tags, {})
	vim.keymap.set('n', '<leader>dk', builtin.grep_string, {})
	
	-- override the default select and create new window to be the
	-- same as the split for normal mode and tmux 
	mappings.default_mappings["i"]["<C-w>s"] = actions.select_horizontal
	mappings.default_mappings["i"]["<C-w>d"] = actions.select_vertical
end

function M.setup()
	return {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' }
	}
end

return M
