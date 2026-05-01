return {

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					always_show_tabline = true,
					globalstatus = true,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
						refresh_time = 16, -- ~60fps
						events = {
							"WinEnter",
							"BufEnter",
							"BufWritePost",
							"SessionLoadPost",
							"FileChangedShellPost",
							"VimResized",
							"Filetype",
							"CursorMoved",
							"CursorMovedI",
							"ModeChanged",
						},
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					-- lualine_c = { 'filename', path = 2 },
					lualine_c = {
						{
							"filename",
							path = 1, -- 2 = full absolute path
							-- optional useful settings:
							file_status = false, -- shows readonly / modified symbols
							shorting_target = 40, -- default, shortens path when very long
							symbols = {
								modified = " ●", -- or whatever icon you like
								readonly = " ",
								unnamed = "[No Name]",
							},
						},
					},
					lualine_d = {
						{
							"diagnostics",
							sources = { "nvim_diagnostic" },
							symbols = { error = "   ", warn = "   ", info = "   ", hint = "   " },
							colored = true, -- DIT zorgt voor de kleuren die je zocht!
							update_in_insert = false,
							always_visible = true,
						},
					},
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},
}
