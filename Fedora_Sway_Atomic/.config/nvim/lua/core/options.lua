vim.opt.winborder = "rounded"
vim.opt.swapfile = false
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Sane defaults
vim.opt.number = true
vim.opt.relativenumber = true -- for 5j, 12k navigation
vim.opt.signcolumn = "yes" -- prevents text shifting
vim.opt.wrap = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false -- Go uses real tabs
vim.opt.scrolloff = 10 -- keep cursor away from edges
vim.opt.termguicolors = true
-- vim.opt.clipboard = 'unnamedplus' -- yank to system clipboard
vim.opt.ignorecase = true
vim.opt.smartcase = true -- case-sensitive if you type capitals
vim.opt.undofile = true -- persistent undo across sessions

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.o`
--  For more options, you can see `:help option-list`
vim.o.mouse = "a"
vim.o.showmode = false
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)
vim.o.breakindent = true
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = "yes"
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
-- vim.o.list = true
-- vim.opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' } -- Changed '» ' to '  ' (two spaces)
vim.opt.list = true
vim.opt.listchars = {
	tab = "  ", -- Two spaces: the first is used once, the second repeats
	trail = "·",
	nbsp = "␣",
}
-- Maak ongebruikte variabelen iets lichter grijs zodat ze leesbaar blijven onder de cursor
vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { fg = "#777777", italic = true })

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
-- vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true
