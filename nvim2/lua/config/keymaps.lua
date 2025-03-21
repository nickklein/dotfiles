-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>Q", ":bufdo bdelete<CR>")
vim.keymap.set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "gtd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gd", function()
    require("telescope.builtin").lsp_definitions()
end, { noremap = true, silent = true })
vim.keymap.set("n", "gb", "<C-o>", { noremap = true, silent = true })
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

-- Close all open buffers.
vim.keymap.set("n", "<leader>Q", ":bufdo bdelete<CR>")

-- Paste replace visual selection without copying it.
vim.keymap.set("v", "p", '"_dP')
