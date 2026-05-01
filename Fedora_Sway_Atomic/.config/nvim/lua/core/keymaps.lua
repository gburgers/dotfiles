-- ,
--  keys([[ Basic Keymaps ]])
---------------------------------------------------------------------------------------------------------------
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Restart LSP
vim.keymap.set("n", "<leader>lsp", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })

-- Toggle the quickfix window also when being outside the quicklist window
vim.keymap.set("n", "<leader>q", function()
	-- Check if any window in the current tab is a location list
	local loclist_win = vim.fn.getloclist(0, { winid = 0 }).winid
	local is_open = loclist_win ~= 0

	if is_open then
		vim.cmd("lclose")
	else
		-- Open diagnostics in the location list
		-- { open = true } ensures it opens immediately
		vim.diagnostic.setloclist({ open = true })
	end
end, { desc = "Toggle diagnostic [Q]uickfix list" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", function()
	vim.diagnostic.open_float(nil, { focus = false, border = "rounded", source = true })
end, { desc = "Show diagnostic float" })

-- Open diagnostics window for detail
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic float" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
---
-- Toggle last buffer
vim.keymap.set("n", "gb", "<C-^>", { desc = "Toggle last buffer" })

-- Go to next/previous buffer
vim.keymap.set("n", "<leader>n", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>p", ":bprevious<CR>", { desc = "Prev buffer" })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- Sorteer JSON keys alfabetisch in het huidige bestand
vim.keymap.set("n", "<leader>js", ":%!jq -S .<CR>", { desc = "JSON: Sorteer keys alfabetisch" })

-- Hover (beste voor grote structs)
-- vim.keymap.set("n", "<leader>dh", function()
-- 	require("dap.ui.widgets").hover()
-- end)

-- kleine hover
vim.keymap.set("n", "<leader>dh", function()
	require("dap.ui.widgets").hover()
end)

-- grote view
vim.keymap.set("n", "<leader>dH", function()
	require("dap.ui.widgets").preview(nil, {
		border = "rounded",
		width = math.floor(vim.o.columns * 0.8),
		height = math.floor(vim.o.lines * 0.6),
	})
end)

-- Focus op scopes window
vim.keymap.set("n", "<leader>ds", function()
	require("dapui").elements.scopes.open()
end)

vim.keymap.set("n", "<leader>dr", function()
	require("dap").repl.open()
end)

vim.keymap.set("n", "<leader>dq", "<cmd>close<CR>", { desc = "Debug: Close preview/window" })

-- -- Go Dap Debugger
-- local map = vim.keymap.set
-- -- Debuggen starten / doorgaan
-- map("n", "<F5>", function()
-- 	require("dap").continue()
-- end)
-- -- Stap over huidige regel
-- map("n", "<F10>", function()
-- 	require("dap").step_over()
-- end)
-- -- Stap in functie
-- map("n", "<F11>", function()
-- 	require("dap").step_into()
-- end)
-- -- Stap uit huidige functie
-- map("n", "<F12>", function()
-- 	require("dap").step_out()
-- end)
-- -- Breakpoint togglen op huidige regel
-- map("n", "<leader>db", function()
-- 	require("dap").toggle_breakpoint()
-- end)
-- -- Conditioneel breakpoint (vraagt om conditie)
-- map("n", "<leader>dB", function()
-- 	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
-- end)
-- -- Debug de test onder de cursor (werkt in *_test.go bestanden)
-- map("n", "<leader>dt", function()
-- 	require("dap").debug_test()
-- end)
--
-- -- Debug de laatste test opnieuw
-- map("n", "<leader>dT", function()
-- 	require("dap").debug_last_test()
-- end)
-- -- UI togglen
-- map("n", "<leader>du", function()
-- 	require("dap").toggle()
-- end)
-- -- REPL openen (interactieve evaluatie tijdens debug sessie)
-- map("n", "<leader>dr", function()
-- 	require("dap-go").repl.open()
-- end)
-- -- Debugger stoppen en sessie beëindigen
-- map("n", "<leader>dx", function()
-- 	require("dap").terminate()
-- 	require("dapui").close()
-- end)
