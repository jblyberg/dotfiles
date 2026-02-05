return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  opts = {
    legacy_commands = false,

    ui = {
      enable = false,
      bullets = {},
    },

    workspaces = {
      {
        name = "personal",
        path = "~/Notes/Personal Notes",
      },
      {
        name = "projects",
        path = "~/Notes/Projects",
      },
    },

    -- see below for full list of options 👇
  },
}
