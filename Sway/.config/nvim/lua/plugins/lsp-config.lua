-- mason-lspconfig bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together.

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"bashls",
					"gopls",
					"cssls",
					"html",
					"dockerls",
					"docker_compose_language_service",
					"jsonls",
					"marksman",
					"intelephense",
					"sqlls",
					"taplo",
					"tailwindcss",
					"zls",
					"clangd",
					"rust_analyzer",
					"yamlls",
				},
			})
		end,
	},

	-- After setting up mason-lspconfig you may set up servers via lspconfig
	-- require("lspconfig").lua_ls.setup {}
	-- require("lspconfig").rust_analyzer.setup {}
	-- ...

	-- nvim-lspconfig sets up the communication between nvim/mason and the language servers

	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- Setup language servers.
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			capabilities = capabilities
			lspconfig.gopls.setup({})
			capabilities = capabilities
			lspconfig.bashls.setup({})
			capabilities = capabilities
			lspconfig.cssls.setup({})
			capabilities = capabilities
			lspconfig.html.setup({})
			capabilities = capabilities
			lspconfig.dockerls.setup({})
			capabilities = capabilities
			lspconfig.docker_compose_language_service.setup({})
			capabilities = capabilities
			lspconfig.jsonls.setup({})
			capabilities = capabilities
			lspconfig.marksman.setup({})
			capabilities = capabilities
			lspconfig.intelephense.setup({})
			capabilities = capabilities
			lspconfig.sqlls.setup({})
			capabilities = capabilities
			lspconfig.taplo.setup({})
			capabilities = capabilities
			lspconfig.tailwindcss.setup({})
			capabilities = capabilities
			lspconfig.zls.setup({})
			capabilities = capabilities
			lspconfig.clangd.setup({})
			capabilities = capabilities
			lspconfig.rust_analyzer.setup({})
			capabilities = capabilities
			lspconfig.yamlls.setup({})
			capabilities = capabilities
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
