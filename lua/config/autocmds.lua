-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

local js_ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" }

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("lazyvim_js_lint", { clear = true }),
  callback = function()
    if not vim.tbl_contains(js_ft, vim.bo.filetype) then return end
    local root = vim.fs.root(0, { "package.json", ".git" })
    if not root then return end
    local ok, lint = pcall(require, "lint")
    if not ok then return end
    if vim.fn.executable(root .. "/node_modules/.bin/oxlint") == 1 then
      lint.try_lint("oxlint")
    elseif vim.fn.executable(root .. "/node_modules/.bin/eslint") == 1 then
      lint.try_lint("eslint")
    end
  end,
})
