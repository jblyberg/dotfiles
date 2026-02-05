return {
  "folke/snacks.nvim",

  init = function()
    vim.env.SNACKS_GHOSTTY = "true"
  end,

  opts = function(_, opts)
    local is_mac = vim.fn.has("macunix") == 1

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
        max_width = 50, -- In cells, not pixels
        max_height = 50,
      },

      icons = {
        math = "󰪚 ",
        chart = "󰄧 ",
        image = " ",
      },

      styles = {
        snacks_image = {
          snacks_image = function()
            return {
              relative = "cursor",
              border = "none",
              focusable = false,
              backdrop = false,
              row = 0,
              col = 0,
            }
          end,
        },
      },
    }

    opts.image.convert = {
      cmd = "magick",
      notify = false,
      magick = {
        default = { "{src}[0]", "-scale", "1280x720>" },
        vector = { "-background", "none", "-density", "200", "{src}[0]", "-filter", "lanczos", "-trim" },
        math = { "-density", 192, "{src}[0]", "-trim" },
        pdf = { "-density", 192, "{src}[0]", "-background", "white", "-alpha", "remove", "-trim" },
      },
    }

    if is_mac then
      opts.image.convert.cmd = "/opt/homebrew/opt/imagemagick-full/bin/magick"
      opts.image.convert.magick.vector = {
        "-background", "transparent",
        "-density", "200",
        "{src}[0]", "-filter",
        "lanczos", "-trim"
      }
    end

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
          auto_close = true,
          focus = "list",
          layout = {
            preset = "sidebar",
            preview = false,
            layout = {
              width = 35,
            }
          },

          grep = {
            hidden = false,
          },

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
    {
      "<leader>bi",
      function()
        local cache = vim.fn.stdpath("cache") .. "/snacks/image"
        vim.fn.delete(cache, "rf")

        -- Refresh current buffer images by reloading the file
        -- This is the most reliable way to force Snacks to see the cache is gone
        vim.cmd("edit!")

        Snacks.notify.info("Cache cleared and buffer reloaded")
      end,
      desc = "Refresh Inline Images in current buffer",
    },
  },
}
