if true then
  return {}
end

return {
  "pmizio/typescript-tools.nvim",
  event = { "BufReadPre", "BufNewFile" },
  ft = { "javascript", "typescript", "typescriptreact" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {},
}
