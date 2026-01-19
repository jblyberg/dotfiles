return {
  "ibhagwan/fzf-lua",

  -- opts = function(_, opts)
  -- end,

  keys = {
    { "<leader>/",  false },
    { "<leader>fB", false },
    { "<leader>f/", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
  },
}
