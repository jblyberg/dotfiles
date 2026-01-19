return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      mode = "buffers",
      -- Custom format for buffer names (includes pin icon)
      name_formatter = function(buf)
        -- You can customize how pinned buffers appear
        return buf.name
      end,
      -- Or use indicator icons
      indicator = {
        icon = '  ', -- This is the left indicator
        style = 'icon',
      },

      groups = {
        items = {
          require('bufferline.groups').builtin.pinned:with({ icon = "  " })
        }
      },

      separator_style = "thin",

      buffer_close_icon = '󰅖',
      modified_icon = '● ',
      close_icon = ' ',
      left_trunc_marker = ' ',
      right_trunc_marker = ' ',

      always_show_bufferline = false,
      auto_toggle_bufferline = false,
      hover = {
        enabled = true,
        delay = 200,
        reveal = { 'close' }
      },

      -- Custom filter to show pin status
      custom_filter = function(buf_number, buf_numbers)
        return true
      end,
    },
  },

  config = function(_, opts)
    require('bufferline').setup(opts)

    -- Create toggle command
    vim.api.nvim_create_user_command('BufferlineToggle', function()
      if vim.opt.showtabline:get() == 2 then
        vim.opt.showtabline = 0
      else
        vim.opt.showtabline = 2
      end
    end, {})

    vim.keymap.set('n', '<leader>bB', '<Cmd>BufferlineToggle<CR>', { desc = 'Toggle bufferline' })
  end
}
