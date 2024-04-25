if true then
  return {}
end
return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      -- config
      theme = "hyper",
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          { desc = " Update", group = "@property", action = "Lazy update", key = "u" },
          {
            icon_hl = "@variable",
            desc = " Files",
            group = "Label",
            action = "Telescope find_files",
            key = "f",
          },
          {
            desc = " Git Status",
            group = "DiagnosticHint",
            action = "Telescope git_status",
            key = "s",
          },
          {
            desc = " Git Commits",
            group = "Number",
            action = "Telescope git_commits",
            key = "c",
          },
        },
        footer = {
          "",
          "",
          "",
          " If you don’t take risks, you can’t create a future.",
        },
        mru = {
          limit = 5,
          cwd_only = true,
        },
      },
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
