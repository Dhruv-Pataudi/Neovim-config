return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",

		config = function()
			require("nvim-treesitter").setup({
				ensure_installed = {
					"c",
					"cpp",
					"lua",
					"javascript",
					"typescript",
					"html",
					"css",
					"python",
				},
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
				},
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = { "nvim-treesitter/nvim-treesitter" },

		config = function()
			require("nvim-ts-autotag").setup({
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			})
		end,
	},
}
