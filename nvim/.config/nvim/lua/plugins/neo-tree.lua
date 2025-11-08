return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
      },
    },
    -- window = {
    --   mappings = {
    --     ["Z"] = "close_all_nodes",
    --   },
    -- },
  },
  keys = {
    { "<leader>e", false },
    {
      "<leader>f.",
      function()
        require("neo-tree.command").execute({ action = "focus" })
      end,
      desc = "Focus NeoTree",
    },
    { "<C-n>", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
  },
}
