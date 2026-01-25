return {
  "folke/snacks.nvim",
  -- enabled = false,
  opts = function(_, opts)
    opts.dashboard = { enabled = false }

    opts.explorer = {
      enabled = true,
      replace_netrw = true,
    }

    opts.image = {
      enabled = true,
      inline = true,
      float = false,
      doc = {
        enabled = true,
        inline = true,

        -- Height and width is in cells, not pixels
        max_width = 60,
        max_height = 30,
      },
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

    opts.picker = {
      hidden = true,
      ignored = true,

      actions = {
        copy_filename = function(picker)
          local item = picker:current()
          if item then
            local filename = vim.fn.fnamemodify(item.file or item.text, ':t')
            vim.fn.setreg('+', filename)
            Snacks.notify('Copied filename: ' .. filename)
          end
        end,

        copy_relpath = function(picker)
          local item = picker:current()
          if item then
            local path = vim.fn.fnamemodify(item.file or item.text, ':.')
            vim.fn.setreg('+', path)
            Snacks.notify('Copied path: ' .. path)
          end
        end,

        copy_abspath = function(picker)
          local item = picker:current()
          if item then
            local path = vim.fn.fnamemodify(item.file or item.text, ':p')
            vim.fn.setreg('+', path)
            Snacks.notify('Copied absolute path: ' .. path)
          end
        end,
      },

      layout = {
        cycle = false,
      },

      sources = {
        explorer = {
          layout = {
            -- auto_hide = { "input" },
            focus = "input",
            preset = "sidebar",
            preview = false,
          },
          focus = "input",
          auto_close = true,

          win = {
            input = {
              keys = {
                ['<C-n>'] = { "close", mode = { "i", "n" } },
              },


            },
            list = {
              keys = {
                ['<C-n>'] = { "close", mode = { "i", "n" } },
                ['f'] = false,
                ['ff'] = 'copy_filename',
                ['fp'] = 'copy_relpath',
                ['fP'] = 'copy_abspath',
              },
            },
          }
        },
      },

    }
  end,

  keys = {
    {
      "<C-n>",
      function()
        Snacks.explorer()
      end,
      desc = "Toggle Snacks Explorer",
    },
  },
}
