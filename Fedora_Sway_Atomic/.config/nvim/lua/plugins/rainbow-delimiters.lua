return {

	{
		"hiphish/rainbow-delimiters.nvim",
		name = "rainbow-delimiters",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			local rainbow_delimiters = require("rainbow-delimiters")

			require("rainbow-delimiters.setup").setup({
				strategy = {
					[""] = rainbow_delimiters.strategy["global"],
				},
				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks",
				},
				highlight = {
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterYellow",
					"RainbowDelimiterViolet",
					"RainbowDelimiterBlue",
					"RainbowDelimiterCyan",
					"RainbowDelimiterRed",
				},
			})
		end,
	},
}
