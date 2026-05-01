return {
	"catgoose/templ-goto-definition",
	ft = { "go" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		-- Laad de plugin (dit zorgt voor de interne override)
		require("templ-goto-definition").setup()

		-- Forceer override van jouw 'grd' mapping zodra gopls attached is
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("TemplGotoOverride", { clear = true }),
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client and client.name == "gopls" then
					vim.keymap.set("n", "grd", function()
						-- Roep de originele LSP definition aan → plugin pikt het op
						vim.lsp.buf.definition()
					end, {
						buffer = args.buf,
						desc = "LSP: Goto Definition (templ aware)",
						silent = true,
					})
				end
			end,
		})
	end,
}
