-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>Q", ":bufdo bdelete<CR>")
vim.keymap.set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>")
vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>")

vim.keymap.set("n", "<Up>", "<Nop>", { silent = true })
vim.keymap.set("n", "<Down>", "<Nop>", { silent = true })
vim.keymap.set("n", "<Left>", "<Nop>", { silent = true })
vim.keymap.set("n", "<Right>", "<Nop>", { silent = true })

vim.keymap.set("i", "<Up>", "<Nop>", { silent = true })
vim.keymap.set("i", "<Down>", "<Nop>", { silent = true })
vim.keymap.set("i", "<Left>", "<Nop>", { silent = true })
vim.keymap.set("i", "<Right>", "<Nop>", { silent = true })

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
