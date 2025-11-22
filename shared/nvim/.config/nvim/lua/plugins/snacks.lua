return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.dashboard = { enabled = false }
    opts.indent = {
      filter = function(buf)
        -- Get the filetype and buffer type for the current buffer
        local filetype = vim.bo[buf].filetype
        local buftype = vim.bo[buf].buftype

        if buftype ~= "" then
          return false
        end

        -- Disable for markdown files that are normal file buffers
        if filetype == "markdown" and buftype == "" then
          return false
        end

        -- Enable for all others
        return true
      end,
    }
  end,
}
