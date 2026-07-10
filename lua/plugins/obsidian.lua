return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy=false,
  ft = "markdown",
  cmd = {
    "ObsidianNew",
    "ObsidianQuickSwitch",
    "ObsidianFollowLink",
    "ObsidianSearch",
    "ObsidianTemplate",
    "ObsidianToday",
    "ObsidianYesterday",
    "ObsidianOpen",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
      {
        name = "work",
        path = "~/vaults/work",
      },
    },
  },
}
