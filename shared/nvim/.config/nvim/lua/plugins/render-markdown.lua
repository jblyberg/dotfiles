return {
  "MeanderingProgrammer/render-markdown.nvim",

  opts = function(_, opts)
    opts.anti_conceal = {
      enabled = true,
      ignore = {
        code_background = true,
        indent = true,
        sign = true,
        virtual_lines = true,
        latex = true,
      },
    }

    opts.bullet = {
      enabled = true,
      render_modes = false,
      icons = { '●', '○', '◆', '◇' },
      ordered_icons = function(ctx)
        local value = vim.trim(ctx.value)
        local index = tonumber(value:sub(1, #value - 1))
        return ('%d.'):format(index > 1 and index or ctx.index)
      end,
      left_pad = 0,
      right_pad = 0,
      highlight = 'RenderMarkdownBullet',
      scope_highlight = {},
      scope_priority = nil,
    }

    opts.checkbox = {
      enabled = true,
      unchecked = {
        icon = '󰄱 ',
        highlight = 'RenderMarkdownUnchecked',
        scope_highlight = nil,
      },
      checked = {
        icon = '󰱒 ',
        highlight = 'RenderMarkdownChecked',
        scope_highlight = nil,
      },
      custom = {
        todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
      },
      scope_priority = nil,
    }

    opts.code = {
      border = true,
      border_virtual = true,
      above = ' ',
      below = ' ',
      language_info = true,
      language_icon = true,
      language_name = true,
      disable_background = true,
    }

    opts.heading = {
      -- border = false,
      icons = {
        '󰉫 # 󰄾 ',
        '󰉬 ## 󰄾 ',
        '󰉭 ### 󰄾 ',
        '󰉮 #### 󰄾 ',
        '󰉯 ##### 󰄾 ',
        '󰉰 ###### 󰄾 '
      },
      position = 'inline',
      backgrounds = {},
    }

    opts.pipe_table = {
      alignment_indicator = '─',
      preset = 'trimmed',
    }

    opts.render_modes = { 'n', 'c', 't' }

    opts.yaml = { enabled = false }
  end
}
