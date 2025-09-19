return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")

		lspconfig.lua_ls.setup({})
		lspconfig.pyright.setup({})
		lspconfig.ts_ls.setup({})
		lspconfig.clangd.setup({})
		lspconfig.html.setup({})
		lspconfig.cssls.setup({})
	end,
}
