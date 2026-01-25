return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  opts = {
    ui = {
      enable = false,
      bullets = {},
    },

    workspaces = {
      {
        name = "personal",
        path = "~/Shares/syncthing/obsidian/Personal Notes",
      },
      {
        name = "projects",
        path = "~/Shares/syncthing/obsidian/Projects",
      },
    },

    -- see below for full list of options 👇
  },
}
