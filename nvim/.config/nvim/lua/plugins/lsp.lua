return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "lua",
        "vim",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "markdown",
        "markdown_inline",
        "json",
        "bash",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "thrift",
        "proto",
      })
    end,
  },
  -- mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        -- "deno",
        "prettierd",
        "prettier",
        "eslint_d",
        "tailwindcss-language-server",
        "emmet-language-server",

        -- go
        "gopls",
        "gofumpt",
        "goimports-reviser",
      },
    },
  },
}
