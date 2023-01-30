local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local action = null_ls.builtins.code_actions

null_ls.setup({
	sources = {
		-- formatters
		formatting.gofmt,
		formatting.goimports,
		formatting.prettier,
		formatting.autopep8,
		formatting.stylua,
		formatting.isort,
		formatting.codespell.with({ filetypes = { "markdown" } }),

		-- diagnostics
		diagnostics.eslint,

		-- actions
		action.eslint,
		action.refactoring,
	},
	on_attach = function(client)
		if client.server_capabilities.documentFormattingProvider then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
		end
		vim.cmd([[
		  augroup document_highlight
		    autocmd! * <buffer>
		    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
		  augroup END
		]])
	end,
})
