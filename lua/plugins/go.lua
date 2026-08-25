return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gopls = {
        -- Modern gopls reports semanticTokensProvider natively, so the LazyVim
        -- workaround that accesses capabilities.textDocument (which can be nil)
        -- is not needed and causes a crash on attach.
        init_options = {
          semanticTokens = false,
        },
      },
    },
  },
}
