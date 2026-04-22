-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Free up l for LLM stuff
vim.keymap.del("n", "<leader>L")
vim.keymap.del("n", "<leader>l")
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- CodeCompanion
vim.keymap.set("n", "<leader>l", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle chat buffer" })
vim.keymap.set("v", "<leader>l", ":'<, '>CodeCompanion<cr> ", { desc = "Inline assistant" })
vim.keymap.set("n", "<leader>ln", "<cmd>CodeCompanionChat<cr>", { desc = "New chat buffer" })

-- gen.nvim (LLM generation)
vim.keymap.set({ "n", "v" }, "<leader>g", ":Gen<CR>", { desc = "Generate with LLM" })
vim.keymap.set("n", "<leader>gg", ":Gen Chat<CR>", { desc = "Chat with LLM" })

-- Diagnostics toggle
local function toggle_virtual_text()
  local config = vim.diagnostic.config()
  local current = config.virtual_text
  vim.diagnostic.config({ virtual_text = not current })
end
vim.keymap.set("n", "<leader>ue", toggle_virtual_text, { desc = "Toggle virtual text diagnostics" })
