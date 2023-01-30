require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	ensure_installed = { "help", "python", "lua", "rust", "typescript", "javascript", "go" },
	auto_install = true,
	context_commentstring = {
		enable = true,
		enable_autocmd = true,
	},
})
