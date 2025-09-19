return {
	{
		"mason-org/mason.nvim",
		opts = {},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},

		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"lua_ls",
					"ts_ls",
					"pyright",
					"html",
					"cssls",
					"jsonls",
					"bashls",
					"yamlls",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"stylua",
				"shfmt",
				"prettierd",
				"prettier",
				"black",
				"isort",
				"clang-format",
				"luacheck",
			},
			auto_update = true,
			run_on_start = true,
		},
	},
}
