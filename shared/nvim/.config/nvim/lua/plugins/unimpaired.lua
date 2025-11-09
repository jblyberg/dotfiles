return {
  "tummetott/unimpaired.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("unimpaired").setup({
      keymaps = {
        -- To overwrite the mapping, keymap description and dot-repetition for
        -- ':bnext', write
        bnext = {
          mapping = "<M-Right>",
          description = "Go to next buffer",
          dot_repeat = true,
        },

        -- To disable dot repetition for ':bprevious', write
        bprevious = {
          mapping = "<M-Left>",
          description = "Go to previous buffer",
          dot_repeat = false,
        },

        -- If you just want to change the keymap for ':bfirst' and don't care
        -- about desciption and dot-repetition, write the shorthand
        -- bfirst = "<leader>N",
        bfirst = false,

        -- To disable the kemap ':blast' completely, set it to false
        blast = false,
      },

      -- Disable the default mappings if you prefer to define your own mappings
      default_keymaps = false,
    })
  end,
}
