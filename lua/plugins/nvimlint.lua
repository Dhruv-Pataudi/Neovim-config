return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			lua = { "luacheck" },
			python = { "ruff" },
			javascript = { "eslint_d" },
			cpp = { "clangtidy" },
			c = { "clangtidy" },
			sh = { "shellcheck" },
			xml = { "xmllint" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
