return {
  "L3MON4D3/LuaSnip",
  event = { "BufReadPre", "BufNewFile" },
  opts = function(_, opts)
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets/vscode" } })
  end,
}
