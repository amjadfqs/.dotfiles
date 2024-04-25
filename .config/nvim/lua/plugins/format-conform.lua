return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      fish = { "fish_indent" },
      javascript = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      json = { { "prettierd", "prettier" } },
      html = { { "prettierd", "prettier" } },
      css = { { "prettierd", "prettier" } },
      mdx = { { "prettierd", "prettier" } },
      typescriptreact = { { "prettierd", "prettier" } },
      javascriptreact = { { "prettierd", "prettierd" } },
      -- go
      go = { { "gofumpt", "goimports-reviser" } },
    },
    -- format_on_save = {
    --   -- I recommend these options. See :help conform.format for details.
    --   lsp_fallback = true,
    --   timeout_ms = 500,
    -- },
  },
}
