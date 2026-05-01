return {

	{
		"nvim-treesitter/nvim-treesitter",
		enabled = true,
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")

			-- In 2025, you manually call install for your languages
			-- This is a no-op if they are already installed
			ts.install({
				"go",
				"templ",
				"yaml",
				"json",
				"bash",
				"c",
				"lua",
				"markdown",
				"vim",
				"vimdoc",
			})

			-- Highlighting is now handled by the new API or is on by default
			-- You can still manually enable it if needed:
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					if pcall(vim.treesitter.start) then
						-- Highlighting started successfully
					end
				end,
			})
		end,
	},
}
