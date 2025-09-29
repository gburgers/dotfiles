-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.shiftwidth = 4 -- Size of an indent
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.clipboard = "unnamedplus"
vim.g.snacks_animate = false
opt.list = false
-- vim.filetype.add({
--   extension = {
--     templ = "templ",
--   },
-- })
vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = vim.lsp.buf.format })
