function setup_lazy_nvim()
	-- this clones the lazy.nvim git repo and puts it into
	-- the path specified by lazypath. Probably somewhere like
	-- ~/.local/share/nvim
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

	-- now that we've cloned the git repo, we prepend the
	-- git repo for lazy.nvim to our runtimepath.
	-- The runtimepath is where neovim looks for lua modules to load
	-- By adding lazy path to the front, we can guarantee that we're now
	-- going to find it when we call require.
	vim.opt.rtp:prepend(lazypath)
end

function get_plugin_names()
	-- find all files in /lua of the form <name>.lua and return the name portion
	plugins = {}
	config_path = vim.fn.stdpath("config") .. "/lua"
	for file in io.popen('ls ' .. config_path):lines() do
		local start_pos, end_pos = string.find(file, "%.")
		name = string.sub(file, 0, end_pos - 1)
		table.insert(plugins, name)
	end

	return plugins
end

function load_plugins()
	-- load all files in /lua with lazy.nvim and call their post_setup function
	plugin_names = get_plugin_names()
	plugin_modules = {}
	lazy_setup = {}

	for _, plugin in pairs(plugin_names) do
		table.insert(plugin_modules, require(plugin))
		table.insert(lazy_setup, require(plugin).setup())
	end

	require("lazy").setup(lazy_setup)

	for _, plugin in pairs(plugin_modules) do
		plugin.post_setup()
	end
end

setup_lazy_nvim()
load_plugins()
