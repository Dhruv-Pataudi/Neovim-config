return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		opts = function()
			local ok, alpha = pcall(require, "alpha")
			if not ok then
				return {}
			end
			local dashboard = require("alpha.themes.dashboard")

			-- Colorful palette
			local palette = {
				inky = "#C8C8D0",
				dim = "#7C7C88",
				ember = "#FFB86C",
				blood = "#E94560",
				violet = "#A78BFA", -- N
				aqua = "#5EEAD4", -- E
				neon = "#67FF9A", -- O
				yellow = "#FDE047", -- V
				blue = "#7AA2F7", -- I
				magenta = "#F472B6", -- M
			}

			-- Highlight groups for each letter and other elements
			vim.api.nvim_set_hl(0, "AlphaHeaderN", { fg = palette.violet, bold = true })
			vim.api.nvim_set_hl(0, "AlphaHeaderE", { fg = palette.aqua, bold = true })
			vim.api.nvim_set_hl(0, "AlphaHeaderO", { fg = palette.neon, bold = true })
			vim.api.nvim_set_hl(0, "AlphaHeaderV", { fg = palette.yellow, bold = true })
			vim.api.nvim_set_hl(0, "AlphaHeaderI", { fg = palette.blue, bold = true })
			vim.api.nvim_set_hl(0, "AlphaHeaderM", { fg = palette.magenta, bold = true })
			vim.api.nvim_set_hl(0, "AlphaSubtle", { fg = palette.dim })
			vim.api.nvim_set_hl(0, "AlphaInk", { fg = palette.inky })
			vim.api.nvim_set_hl(0, "AlphaRune", { fg = palette.violet })
			vim.api.nvim_set_hl(0, "AlphaBlood", { fg = palette.blood, bold = true })
			vim.api.nvim_set_hl(0, "AlphaEmber", { fg = palette.ember, italic = true })
			vim.api.nvim_set_hl(0, "AlphaFooter", { fg = palette.dim, italic = true })

			-- Header using your provided ASCII art
			dashboard.section.header.val = {
				" ",
				"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
				"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
				"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
				"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
				"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
				"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
				" ",
			}

			-- Precise per-letter coloring via column ranges
			dashboard.section.header.opts = {
				position = "center",
				hl = {
					-- Highlight Group, Start Column, End Column
					{ "AlphaHeaderN", 1, 11 },
					{ "AlphaHeaderE", 12, 19 },
					{ "AlphaHeaderO", 20, 26 },
					{ "AlphaHeaderV", 27, 35 },
					{ "AlphaHeaderI", 36, 38 },
					{ "AlphaHeaderM", 39, 50 },
				},
			}

			-- Centered subtle shadow element
			dashboard.section.top = {
				type = "text",
				val = { "— ◊ —" },
				opts = { position = "center", hl = "AlphaSubtle" },
			}

			-- Centered quote
			dashboard.section.middle = {
				type = "text",
				val = { "“Through the chromatic gates, logic flows.”" },
				opts = { position = "center", hl = "AlphaEmber" },
			}

			-- Buttons remain the same
			local function btn(sc, txt, cmd, hl)
				local b = dashboard.button(sc, txt, cmd)
				b.opts.hl = hl or "AlphaInk"
				b.opts.hl_shortcut = "AlphaBlood"
				b.opts.cursor = 5
				return b
			end
			local has_telescope = pcall(require, "telescope")
			local has_persist = pcall(require, "persistence")
			dashboard.section.buttons.val = {
				btn("f", "󰈞 Find File", has_telescope and ":Telescope find_files<CR>" or ":ene<CR>", "AlphaInk"),
				btn("r", "󰚰 Recent", has_telescope and ":Telescope oldfiles<CR>" or ":ene<CR>", "AlphaInk"),
				btn("n", "󰝒 New File", ":ene | startinsert<CR>", "AlphaRune"),
				btn(
					"s",
					"󰒲 Restore",
					has_persist and "lua require('persistence').load()<CR>" or ":ene<CR>",
					"AlphaRune"
				),
				btn("c", "󰙨 Config", ":e $MYVIMRC<CR>", "AlphaBlood"),
				btn("q", "󰩈 Quit", ":qa<CR>", "AlphaBlood"),
			}

			-- Dynamic footer text
			local function footer_lines()
				local v = vim.version()
				local ver = ("v%d.%d.%d"):format(v.major, v.minor, v.patch)
				local cwd = vim.fn.fnamemodify((vim.uv or vim.loop).cwd() or "", ":t")
				local plug = pcall(require, "lazy") and #require("lazy").plugins() or 0
				return {
					(" %s • %d plugins •  %s"):format(ver, plug, cwd),
				}
			end
			dashboard.section.footer.val = footer_lines()
			dashboard.section.footer.opts = { position = "center", hl = "AlphaFooter" }

			-- New colorful and centered bottom sigil
			local bottom_sigil = {
				" ",
				"           /\\",
				"          /  \\",
				"    _____/____\\_____",
				"   /\\    `----`    /\\",
				"  /  \\   //  \\\\   /  \\",
				" /____\\ //____\\\\ /____\\",
				" `----` `------` `----`",
				" ",
			}
			local bottom = {
				type = "text",
				val = bottom_sigil,
				opts = {
					position = "center",
					hl = {
						{ "AlphaHeaderN", 0, -1 },
						{ "AlphaHeaderE", 0, -1 },
						{ "AlphaHeaderO", 0, -1 },
						{ "AlphaHeaderV", 0, -1 },
						{ "AlphaHeaderI", 0, -1 },
						{ "AlphaHeaderM", 0, -1 },
						{ "AlphaHeaderN", 0, -1 },
						{ "AlphaHeaderE", 0, -1 },
					},
				},
			}

			-- Final layout, fully centered
			dashboard.config.layout = {
				{ type = "padding", val = 2 },
				dashboard.section.header,
				{ type = "padding", val = 1 },
				dashboard.section.top,
				{ type = "padding", val = 1 },
				dashboard.section.middle,
				{ type = "padding", val = 2 },
				dashboard.section.buttons,
				{ type = "padding", val = 2 },
				dashboard.section.footer,
				bottom,
			}

			-- Timer for footer pulse (safe version)
			local uv = vim.uv or vim.loop
			local timer = uv.new_timer()
			timer:start(
				0,
				1200,
				vim.schedule_wrap(function()
					if vim.bo.filetype ~= "alpha" then
						return
					end
					dashboard.section.footer.val = footer_lines()
					local tick = os.time() % 2
					vim.api.nvim_set_hl(0, "AlphaFooter", {
						fg = tick == 0 and palette.dim or palette.ember,
						italic = true,
					})
					pcall(alpha.redraw)
				end)
			)

			return dashboard.config
		end,
		config = function(_, opts)
			require("alpha").setup(opts)
		end,
	},
}
