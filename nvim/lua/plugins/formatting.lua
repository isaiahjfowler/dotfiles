return {
  "nvimtools/none-ls.nvim",

  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        require("none-ls.diagnostics.eslint_d"),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
      },
    })

    -- Normal mode formatting
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format)

    -- Visual mode formatting
    vim.keymap.set("v", "<leader>gf", function()
      -- Save the original cursor position
      local cursor_pos = vim.api.nvim_win_get_cursor(0)

      -- Get the position of the start and end of the selection
      local start_pos = vim.api.nvim_buf_get_mark(0, "<")
      local end_pos = vim.api.nvim_buf_get_mark(0, ">")

      -- Format the range
      vim.lsp.buf.format({
        range = {
          ["start"] = { start_pos[1] - 1, start_pos[2] },
          ["end"] = { end_pos[1] - 1, end_pos[2] },
        },
      })

      -- Restore the original cursor position
      vim.api.nvim_win_set_cursor(0, cursor_pos)
    end)
  end,
}

