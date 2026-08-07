local js_ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" }

local function has_bin(ctx, bin)
  local root = vim.fs.root(ctx.filename, { "package.json", ".git" })
  return root ~= nil and vim.fn.executable(root .. "/node_modules/.bin/" .. bin) == 1
end

return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      oxfmt = {
        command = "oxfmt",
        args = { "--stdin-filepath", "$FILENAME" },
        stdin = true,
        condition = function(self, ctx) return has_bin(ctx, "oxfmt") end,
      },
      prettier = {
        condition = function(self, ctx) return has_bin(ctx, "prettier") end,
      },
    },
    formatters_by_ft = vim.iter(js_ft):fold({}, function(acc, ft)
      acc[ft] = { "oxfmt", "prettier", stop_after_first = true }
      return acc
    end),
  },
}
