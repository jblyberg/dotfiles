return {
  'nvim-mini/mini.icons',
  lazy = false,
  opts = function(_, opts)
    opts.directory = {
      ['.godot'] = { glyph = ' ', hl = 'MiniIconsExtGodot' },
    }

    opts.extension = {
      godot      = { glyph = ' ', hl = 'MiniIconsExtGodot' },
      tscn       = { glyph = ' ', hl = 'MiniIconsExtTscn' },
      import     = { glyph = '󰋺 ', hl = 'MiniIconsExtImport' },
      markdown   = { glyph = ' ', hl = 'MiniIconsExtMd' },
      md         = { glyph = ' ', hl = 'MiniIconsExtMd' },
      p8         = { glyph = '󱎓 ', hl = 'MiniIconsExtP8' },
      pipe       = { glyph = '󰟦 ', hl = 'MiniIconsExtPipe' },
      sh         = { glyph = ' ', hl = 'MiniIconsExtSh' },
      ['cs.uid'] = { glyph = ' ', hl = 'MiniIconsExtCsUid' },
      ['gd.uid'] = { glyph = ' ', hl = 'MiniIconsExtGdUid' },
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
