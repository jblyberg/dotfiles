return {
  'nvim-mini/mini.icons',
  -- priority = 1, -- High priority loads early, but you might need lazy loading
  lazy = false,
  opts = function(_, opts)
    opts.extension = {
      godot      = { glyph = ' ', hl = 'MiniIconsExtGodot' },
      import     = { glyph = '󰋺 ', hl = 'MiniIconsExtImport' },
      markdown   = { glyph = ' ', hl = 'MiniIconsExtMd' },
      md         = { glyph = ' ', hl = 'MiniIconsExtMd' },
      p8         = { glyph = '󱎓 ', hl = 'MiniIconsExtP8' },
      pipe       = { glyph = '󰟦 ', hl = 'MiniIconsExtPipe' },
      ['cs.uid'] = { glyph = ' ', hl = 'MiniIconsExtUid' },
      ['gd.uid'] = { glyph = ' ', hl = 'MiniIconsExtUid' },
    }

    opts.file = {
      ['README.md'] = { glyph = ' ', hl = 'MiniIconsFileReadmeMd' },
      ['readme.md'] = { glyph = ' ', hl = 'MiniIconsFileReadmeMd' },
    }

    return opts
  end,

  config = function(_, opts)
    require('mini.icons').setup(opts)
    -- Force refresh after other plugins load
    vim.schedule(function()
      require('mini.icons').setup(opts)
    end)
  end,
}
