-- local Util = require("lazyvim.util")

return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    opts.defaults = {
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
        },
      },
    }
  end,

  keys = {
    -- { "<leader>/", false },
    -- { "<leader>f/", Util.pick("live_grep"), desc = "Grep (root dir)" },
    { "<leader>uN", "<cmd>Telescope notify<CR>", desc = "Show closed notifications" },
  },
}
