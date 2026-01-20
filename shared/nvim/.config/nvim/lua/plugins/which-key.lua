return {
  "folke/which-key.nvim",

  opts = function(_, opts)
    opts.preset = "modern"

    local wk = require("which-key")

    wk.add({
      { "<leader>?", icon = "" },
      { "<leader>]", desc = "AI tools", icon = "󰵰" },
      { "<leader>m", group = "markdown", icon = "󰍔" },
      { "<leader>n", icon = "󰎟" },
      { "<leader>p", icon = "󱛣" },
      { "<leader>v", group = "run scripts", icon = "󰢻" },
      { "K", icon = "󰋽" },
      { "0", desc = "Start of line", icon = "" },
      { "b", desc = "Previous word", icon = "󰼨" },
      { "B", desc = "Previous WORD", icon = "󰒮" },
      { "c", desc = "Change", icon = "󰤀" },
      { "d", desc = "Delete", icon = "󰆐" },
      { "e", desc = "Next end of word", icon = "󰼧" },
      { "E", desc = "Next end of WORD", icon = "󰒭" },
      { "f", desc = "Next character", icon = "󰙢" },
      { "F", desc = "Previous character", icon = "󰙤" },
      { "G", desc = "Last line", icon = "" },
      { "h", desc = "Left", icon = "" },
      { "H", desc = "First line", icon = "" },
      { "i", desc = "Insert mode", icon = "󰤌" },
      { "j", desc = "Up", icon = "" },
      { "k", desc = "Down", icon = "" },
      { "l", desc = "Right", icon = "" },
      { "L", desc = "Last line", icon = "" },
      { "M", desc = "Middle line", icon = "󰝔" },
      { "n", desc = "Next search result", icon = "" },
      { "N", desc = "Previous search result", icon = "" },
      { "p", desc = "Paste after cursor", icon = "󰆒" },
      { "T", desc = "Flash: search before cursor", icon = "" },
      { "v", desc = "Visual mode", icon = "" },
      { "V", desc = "Visual line", icon = "󰡮" },
      { "w", desc = "Next word", icon = "󰼧" },
      { "W", desc = "Next WORD", icon = "󰒭" },
      { "Y", desc = "Yank line", icon = "" },
    })

    local custom_specs = {
      { "<leader>b", group = "buffers", icon = "" },
      { "<leader>bB", icon = { icon = "", color = "yellow" } },
    }

    -- Append our custom specs to the existing ones
    for _, s in ipairs(custom_specs) do
      table.insert(opts.spec, s)
    end

    opts.icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = " 󰐒 ", -- symbol prepended to a group
      ellipsis = "…",
    }

    -- return opts
  end,

}
