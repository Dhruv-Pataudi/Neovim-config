return{
	"nvim-neo-tree/neo-tree.nvim",
    	branch = "v3.x",
    	dependencies = {
      		"nvim-lua/plenary.nvim",
      		"MunifTanjim/nui.nvim",
      		"nvim-tree/nvim-web-devicons", 
	},
	lazy = false,
	
	config = function()
		require("neo-tree").setup({
			window = {
				position = "left",
				width = 30,
			},
			filesystem ={
				follow_current_file = {
					enabled = true,
				},
			},
		})

		vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', {})
	end,
}
