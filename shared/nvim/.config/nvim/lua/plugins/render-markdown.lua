return {
  "MeanderingProgrammer/render-markdown.nvim",

  -- enabled = false,

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

    opts.code = {
      style = 'normal',
      left_pad = 2,
      language_pad = 2,
      disable_background = true,
    }

    opts.bullet = { left_pad = 2 }

    opts.checkbox = {
      enabled = true,
      left_pad = 2,
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

    -- opts.anti_conceal = { enabled = false }
    opts.heading = {
      -- border = false,
      icons = { '󰉫 ', '󰉬 ', '󰉭 ', '󰉮 ', '󰉯 ', '󰉰 ' },
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
