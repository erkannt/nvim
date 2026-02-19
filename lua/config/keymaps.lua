-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Free up l for LLM stuff
vim.keymap.del("n", "<leader>L")
vim.keymap.del("n", "<leader>l")
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>r", "<cmd>checktime<cr>", { desc = "Check for external buffer changes" })

-- CodeCompanion
vim.keymap.set("n", "<leader>l", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle chat buffer" })
vim.keymap.set("v", "<leader>l", ":'<, '>CodeCompanion<cr> ", { desc = "Inline assistant" })
vim.keymap.set("n", "<leader>ln", "<cmd>CodeCompanionChat<cr>", { desc = "New chat buffer" })

-- Diagnostics toggle
local function toggle_virtual_text()
  local config = vim.diagnostic.config()
  local current = config.virtual_text
  vim.diagnostic.config({ virtual_text = not current })
  vim.notify(
    (not current and "Enabled" or "Disabled") .. " virtual text diagnostics",
    vim.log.levels.INFO,
    { title = "Diagnostics" }
  )
end
vim.keymap.set("n", "<leader>ue", toggle_virtual_text, { desc = "Toggle virtual text diagnostics" })
