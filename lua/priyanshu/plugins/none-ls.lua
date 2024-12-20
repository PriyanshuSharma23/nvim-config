return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.pylint,
      },
    })

    Map("n", "<leader>l", ":LspInfo<CR>")
    Map({ "n", "x" }, "<leader>cf", vim.lsp.buf.format)
  end,
}
