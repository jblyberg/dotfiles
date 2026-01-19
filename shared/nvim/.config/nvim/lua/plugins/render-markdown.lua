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
