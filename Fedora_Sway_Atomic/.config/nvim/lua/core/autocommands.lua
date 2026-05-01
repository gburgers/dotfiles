-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Get diagnostic in quicklist
vim.api.nvim_create_autocmd("DiagnosticChanged", {
	callback = function()
		vim.diagnostic.setloclist({ open = false })
	end,
})

-- Automatisch imports regelen voor Go bij het opslaan van een bestand
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		local params = vim.lsp.util.make_range_params()
		params.context = { only = { "source.organizeImports" } }
		-- buf_request_sync voert de actie uit en wacht maximaal 1000ms
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
		for cid, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
					vim.lsp.util.apply_workspace_edit(r.edit, enc)
				end
			end
		end
		-- Formatteer de code ook direct (optioneel, maar aanbevolen voor Go)
		-- vim.lsp.buf.format({ async = false })
	end,
})

-- Wrappen van tekst en sluiten in Debug window
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "dap-float",
-- 	callback = function()
-- 		vim.opt_local.wrap = true
-- 		vim.opt_local.linebreak = true
-- 		vim.opt_local.breakindent = true
-- 		vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = true, silent = true })
-- 		vim.keymap.set("n", "<Esc>", "<cmd>close<CR>", { buffer = true, silent = true })
-- 	end,
-- })
--

vim.api.nvim_create_autocmd("FileType", {
	pattern = "dap-float",
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.breakindent = true
		vim.opt_local.sidescrolloff = 0
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"

		vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = true, silent = true })
		vim.keymap.set("n", "<Esc>", "<cmd>close<CR>", { buffer = true, silent = true })
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#4b2e00" })
		vim.api.nvim_set_hl(0, "DapStopped", { fg = "#ff8800", bold = true })
	end,
})
