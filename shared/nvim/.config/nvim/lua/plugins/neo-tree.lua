return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  opts = {
    close_if_last_window = true,
    auto_close = true,

    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
      },
    },

    event_handlers = {

      {
        event = "file_opened",
        handler = function(file_path)
          --auto close
          require("neo-tree").close_all()
        end
      },

    }
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
    { "<C-n>",     "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
  },
}
