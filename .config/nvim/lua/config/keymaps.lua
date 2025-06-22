-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>cp", "<cmd>Huefy<cr>")

vim.keymap.set("n", "<leader>tt", function()
  local line = vim.fn.getline(".")
  if line:match("%- %[%s%]") then
    line = line:gsub("%- %[%s%]", "- [x]")
  elseif line:match("%- %[x%]") then
    line = line:gsub("%- %[x%]", "- [ ]")
  end
  vim.fn.setline(".", line)
end, { desc = "Toggle Markdown Checkbox" })

vim.keymap.set("n", "<M-h>", "<Cmd>silent !tmux resize-pane -L 1<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-j>", "<Cmd>silent !tmux resize-pane -D 1<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-k>", "<Cmd>silent !tmux resize-pane -U 1<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-l>", "<Cmd>silent !tmux resize-pane -R 1<CR>", { noremap = true, silent = true })
