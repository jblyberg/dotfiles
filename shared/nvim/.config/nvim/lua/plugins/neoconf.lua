return {
  "folke/neoconf.nvim",
  opts = function(_, opts)
    opts.import = {
      vscode = false,
      coc = false,
      nlsp = false,
    }
  end,
}
