return{
	'stevearc/conform.nvim',
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = {'stylua'},
				python = {'isort', 'black'},
				javascript = {'prettierd', 'prettier'},
				c = {'clang_format'},
				cpp = {'clang_format'},
				html = {'prettierd', 'prettier'},
				css = {'prettierd', 'prettier'},
				scss = {'prettierd', 'prettier'},	
			},
			format_on_save = {
				lsp_fallback =true,
				async = false,
				timeout_ms = 1000,
			},
		})
	end,
}
