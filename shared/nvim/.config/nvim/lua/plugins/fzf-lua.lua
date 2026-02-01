return {
  "ibhagwan/fzf-lua",
  opts = {
    fzf_opts = {
      ["--exact"] = "",
    },
  },
  keys = {
    { "<leader>/",       false },
    { "<leader>fB",      false },
    { "<leader>f/",      function() require("fzf-lua").live_grep({ no_hidden = true }) end, desc = "Grep (Root Dir)" },
    { "<leader><space>", function() require("fzf-lua").files({ hidden = false }) end,       desc = "Find (Root Dir)" },
  },
}
