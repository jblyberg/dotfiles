return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.dashboard = { enabled = false }

    opts.explorer = {
      enabled = true,
      replace_netrw = true, -- Replaces the default netrw explorer
    }

    opts.picker = {
      sources = {
        explorer = {
          -- Custom settings for the explorer picker
          layout = {
            auto_hide = { "input" },
            focus = "list",
            preset = "sidebar",
            preview = false,
          },
          focus = "input",   -- Automatically focus search input when opening
          auto_close = true, -- Close explorer after selecting a file
        },
      },
      hidden = true,
      ignored = true,
    }

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

  keys = {

    {
      "<C-n>",
      function()
        -- 1. Find any open explorer pickers
        local explorer = Snacks.picker.get({ source = "explorer" })[1]

        if explorer then
          -- 2. If the explorer is open and currently focused, close it
          if vim.api.nvim_get_current_win() == explorer.input.win then
            explorer:close()
          else
            -- 3. If it's open but you are in another window, jump to it
            explorer:focus()
          end
        else
          -- 4. If no explorer is open, create one
          Snacks.explorer({
            layout = { auto_hide = { "input" } },
            focus = "list",
          })
        end
      end,
      desc = "Toggle Snacks Explorer",
    }
    ,
  },
}
