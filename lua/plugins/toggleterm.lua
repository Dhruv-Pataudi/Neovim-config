return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<leader>t]],
			shading_factor = 2,
			direction = "float",
			float_opts = {
				border = "curved",
				winblend = 3,
			},
		})
	end,
}
