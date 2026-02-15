return {
  "mozanunal/sllm.nvim",
  dependencies = {
    "nvim-mini/mini.notify", -- optional, nicer notifications
    "nvim-mini/mini.pick", -- optional, better picker UI
  },
  config = function()
    require("sllm").setup({
      keymaps = {
        ask = "<leader>ll", -- open prompt and ask LLM
        select_model = "<leader>lm", -- pick a model
        select_mode = "<leader>lM", -- pick a template/mode
        add_context = "<leader>la", -- add file or selection to context
        commands = "<leader>lx", -- open slash command picker
        new_chat = "<leader>ln", -- start new chat
        cancel = "<leader>lc", -- cancel running request
        toggle_buffer = "<leader>lt", -- toggle LLM window
        history = "<leader>lh", -- browse chat history
        copy_code = "<leader>ly", -- copy last code block
        complete = "<leader>l<Tab>", -- inline completion at cursor
      },
    })
  end,
}
