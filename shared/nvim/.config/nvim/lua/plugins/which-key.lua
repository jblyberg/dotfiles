return {
  "folke/which-key.nvim",

  opts = function(_, opts)
    local wk = require("which-key")

    wk.add({
      { "<leader>v", group = "Run scripts", icon = "󰢻" },
    })
  end,

}
