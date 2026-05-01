return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"leoluz/nvim-dap-go",
	},
	keys = {
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "Debug: Start/Continue",
		},
		{
			"<F10>",
			function()
				require("dap").step_over()
			end,
			desc = "Debug: Step Over",
		},
		{
			"<F11>",
			function()
				require("dap").step_into()
			end,
			desc = "Debug: Step Into",
		},
		{
			"<F12>",
			function()
				require("dap").step_out()
			end,
			desc = "Debug: Step Out",
		},
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Debug: Toggle Breakpoint",
		},
		{
			"<leader>dB",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Debug: Conditional Breakpoint",
		},
		{
			"<leader>du",
			function()
				require("dapui").toggle()
			end,
			desc = "Debug: Toggle UI",
		},
		{
			"<leader>dx",
			function()
				require("dap").terminate()
				require("dapui").close()
			end,
			desc = "Debug: Stop",
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- dap.set_log_level("TRACE")

		dapui.setup({
			render = {
				max_value_lines = 5,
				expand_lines = true,
			},

			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.7 }, -- 🔥 belangrijkste (locals)
						{ id = "stacks", size = 0.3 }, -- call stack
					},
					size = 70, -- 🔥 BREED! (default ~40)
					position = "left",
				},

				-- 🔹 ONDERKANT: output + logs
				-- {
				-- 	elements = {
				-- 		{ id = "repl", size = 0.4 },
				-- 		{ id = "console", size = 0.6 }, -- 🔥 errors/logs
				-- 	},
				-- 	size = 12,
				-- 	position = "bottom",
				-- },
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		require("dap-go").setup({
			delve = {
				path = "/home/gerben/go/bin/dlv",
			},
		})

		local function load_project_dap()
			local config_file = vim.fn.getcwd() .. "/.nvim-dap.lua"

			if vim.fn.filereadable(config_file) == 1 then
				return dofile(config_file)
			end

			return {
				program = vim.fn.getcwd(),
				cwd = vim.fn.getcwd(),
			}
		end

		local function setup_dap_highlights()
			vim.api.nvim_set_hl(0, "DapStoppedLine", {
				bg = "#3b2f00", -- iets subtieler maar nog steeds zichtbaar
			})

			vim.api.nvim_set_hl(0, "DapStopped", {
				fg = "#e0af68", -- Tokyo Night geel/oranje kleur
				bold = true,
			})

			vim.fn.sign_define("DapStopped", {
				text = "➜",
				texthl = "DapStopped",
				linehl = "DapStoppedLine",
				numhl = "DapStopped",
			})
		end

		setup_dap_highlights()

		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = setup_dap_highlights,
		})

		local project = load_project_dap()

		dap.configurations.go = {
			{
				type = "go",
				name = "Debug project",
				request = "launch",
				mode = "debug",
				program = project.program,
				cwd = project.cwd,
				substitutePath = project.substitutePath,
			},
		}
	end,
}
