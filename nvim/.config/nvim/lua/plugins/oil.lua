return {
  "stevearc/oil.nvim",
  enabled = false,
  dependencies = { "nvim-mini/mini.icons", "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      columns = { "icon" },
      keymaps = {
        ["<C-h>"] = false,
        ["<M-h"] = "actions.select_split",
      },

      view_options = {
        show_hidden = true,
      },
    })

    local wk = require("which-key")

    -- wk.add({
    --   { "-", "<CMD>Oil<CR>", desc = "Open parent directory in Oil" },
    --   {
    --     "<leader>f-",
    --     function()
    --       require("oil").toggle_float()
    --     end,
    --     desc = "Open Oil in Telescope",
    --   },
    -- })
  end,
}
