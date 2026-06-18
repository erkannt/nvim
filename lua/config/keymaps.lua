-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Diagnostics toggle
local function toggle_virtual_text()
  local config = vim.diagnostic.config()
  local current = config.virtual_text
  vim.diagnostic.config({ virtual_text = not current })
end
vim.keymap.set("n", "<leader>ue", toggle_virtual_text, { desc = "Toggle virtual text diagnostics" })
