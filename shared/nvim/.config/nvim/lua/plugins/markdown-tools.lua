return {
  'magnusriga/markdown-tools.nvim',
  opts = {
    template_dir = vim.fn.expand("~/.config/nvim/templates"),
    picker = "fzf",
    insert_frontmatter = false,
    spell = false,
    spelllang = "en_us",

    -- Keymappings for shortcuts. Set to `false` or `""` to disable.
    keymaps = {
      create_from_template = "<leader>mT", -- New Template
      insert_header = "<leader>mH",        -- Header
      insert_code_block = "<leader>mc",    -- Code block
      insert_bold = "<leader>mb",          -- Bold
      insert_highlight = "<leader>mh",     -- Highlight
      insert_italic = "<leader>mi",        -- Italic
      insert_link = "<leader>ml",          -- Link
      insert_table = "<leader>mt",         -- Table
      insert_checkbox = "<leader>mk",      -- Checkbox
      toggle_checkbox = "<leader>mx",      -- Toggle Checkbox
      preview = "<leader>mp",              -- Preview
    },

    -- Enable/disable specific commands
    commands = {
      create_from_template = true,
      insert_header = true,
      insert_code_block = true,
      insert_bold = true,
      insert_italic = true,
      insert_link = true,
      insert_table = true,
      insert_checkbox = true,
      toggle_checkbox = true,
      preview = false, -- Requires `preview_command` to be set
    },
  },
}
