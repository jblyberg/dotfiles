return {
  {
    "folke/noice.nvim",
    -- enabled = false,
    opts = {
      -- Disable the Noice command line UI
      cmdline = { enabled = false },
      -- Disable Noice messages/notifications
      messages = { enabled = false },
      -- Disable the Noice popupmenu (completion UI)
      popupmenu = { enabled = false },
      -- Disable Noice notify (uses nvim-notify or default instead)
      notify = { enabled = false },
      lsp = {
        -- Ensure LSP hover is still handled by Noice
        hover = { enabled = true },
        signature = { enabled = true }, -- Often desired alongside hover
        override = {
          -- These overrides allow Noice to style the hover window
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        progress = {
          enabled = true,
          -- Change the view from "mini" to "notify" to use floating windows
          view = "mini",
        },
      },
      views = {
        mini = {
          position = {
            -- -1 is the bottom-most line; -2 moves it one line higher
            row = -2,
            col = "100%", -- Keeps it aligned to the right
          },
        },
      },
      presets = {
        -- Disable presets that affect the cmdline/messages
        bottom_search = false,
        command_palette = false,
        long_message_to_split = false,
        inc_rename = false,
        lsp_doc_border = true,
      },
    },
  },
}
