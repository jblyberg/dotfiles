return {
  'nvim-mini/mini.icons',

  opts = function(_, opts)
    opts.extension = {
      md = { glyph = '', hl = 'MiniIconsPurple' },
      p8 = { glyph = '󱎓', hl = 'MiniIconsYellow' }
    }

    return opts
  end,
}
