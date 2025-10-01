return {
	{
		"CRAG666/code_runner.nvim",
		config = function()
			require("code_runner").setup({
				mode = "term",
				focus = true,
				startinsert = true,
			})

			vim.keymap.set("n", "<F5>", "<cmd>RunCode<CR>", { silent = true })
		end,
	},

	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

			dap.adapters.lldb = {
				type = "executable",
				command = "/usr/bin/lldb-vscode", -- adjust for your OS
				name = "lldb",
			}
			dap.configurations.cpp = {
				{
					name = "Launch C++",
					type = "lldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
				},
			}
			dap.configurations.c = dap.configurations.cpp

			dap.adapters.python = {
				type = "executable",
				command = "/usr/bin/python3", -- python interpreter
				args = { "-m", "debugpy.adapter" },
			}
			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch Python",
					program = "${file}",
					pythonPath = function()
						return vim.fn.input("Python interpreter: ", "/usr/bin/python3", "file")
					end,
				},
			}
			dap.adapters.node2 = {
				type = "executable",
				command = "node",
				args = {
					os.getenv("HOME") .. "/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js",
				},
			}
			dap.configurations.javascript = {
				{
					type = "node2",
					request = "launch",
					name = "Launch Node",
					program = "${file}",
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
					protocol = "inspector",
				},
			}
			dap.configurations.lua = {
				{
					type = "local-lua",
					request = "launch",
					name = "Launch Lua",
					cwd = vim.fn.getcwd(),
					program = {
						lua = "lua5.4",
						file = "${file}",
					},
					args = {},
				},
			}
			dap.configurations.typescript = dap.configurations.javascript
			dap.configurations.rust = dap.configurations.cpp
			local keymap = vim.keymap.set

			keymap("n", "<F5>", function()
				require("dap").continue()
			end, { silent = true })
			keymap("n", "<F10>", function()
				require("dap").step_over()
			end, { silent = true })
			keymap("n", "<F11>", function()
				require("dap").step_into()
			end, { silent = true })
			keymap("n", "<F12>", function()
				require("dap").step_out()
			end, { silent = true })
			keymap("n", "<leader>b", function()
				require("dap").toggle_breakpoint()
			end, { silent = true })
			keymap("n", "<leader>B", function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { silent = true })
			keymap("n", "<leader>dr", function()
				require("dap").repl.open()
			end, { silent = true })
			keymap("n", "<leader>dl", function()
				require("dap").run_last()
			end, { silent = true })
		end,
	},
	{
		"nvim-neoset/nvim-nio",
		lazy = true,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dapui = require("dapui")
			dapui.setup()
			local keymap = vim.keymap.set
			keymap("n", "<leader>du", dapui.toggle, { silent = true })
			keymap("n", "<leader>de", dapui.eval, { silent = true })
		end,
	},

	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},
}
