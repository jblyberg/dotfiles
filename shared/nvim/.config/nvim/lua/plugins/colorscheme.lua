-- See: .local/share/nvim/lazy/tokyonight.nvim/extras/lua/tokyonight_moon.lua for color ids

return {
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        transparent = true,
        style = "moon",
        -- on_colors = function(colors)
        --   colors.hint = "#F97316"
        --   colors.error = "#f7768e"
        --   -- colors.bg = "#1c1d2c"
        --   -- colors.bg_statusline = colors.bg
        -- end,

        on_highlights = function(hl, colors)
          hl.CursorLine                            = { bg = "#24263a", }
          hl.CursorLineNr                          = { fg = "#e0af68", bg = "#24263a", }
          hl.HelpWinBar                            = { fg = "#afb42b", bg = "#1a1b26", }
          hl.WinSeparator                          = { fg = "#73daca", bg = "none", }

          -- Spelling
          hl.SpellBad                              = { sp = "#f7768e", undercurl = true }

          -- Render Markdown
          hl.RenderMarkdownBullet                  = { fg = "#e0af68" }
          hl.RenderMarkdownTableHead               = { fg = "#2a9d8f" }
          hl.RenderMarkdownTableRow                = { fg = "#2a9d8f" }
          hl.RenderMarkdownCodeBorder              = { fg = "#F97316", bg = "none" }
          hl.RenderMarkdownDash                    = { fg = "#afb42b", bg = "none" }

          -- Mini Icons
          hl.MiniIconsExtCsUid                     = { fg = "#c3e88d" }
          hl.MiniIconsExtGdUid                     = { fg = "#ffc777" }
          hl.MiniIconsExtGodot                     = { fg = "#cddc39" }
          hl.MiniIconsExtImport                    = { fg = "#E072A4" }
          hl.MiniIconsExtMd                        = { fg = "#afb42b" }
          hl.MiniIconsExtP8                        = { fg = "#b73f73" }
          hl.MiniIconsExtPipe                      = { fg = "#558B6E" }
          hl.MiniIconsExtSh                        = { fg = "#9e9d24" }
          hl.MiniIconsExtTscn                      = { fg = "#b73f73" }
          hl.MiniIconsExtUid                       = { fg = "#B96AC9" }
          hl.MiniIconsFileReadmeMd                 = { fg = "#F97316" }

          hl.SnacksPickerInput                     = { fg = "#ffe0d1", bg = "#1e2030" }
          hl.SnacksPickerInputBorder               = { fg = "#e0af68", bg = "#1e2030" }
          hl.SnacksPickerMatch                     = { fg = "#ff7433" }

          hl["@markup.heading.markdown"]           = { fg = "#8ab17d", bg = "none", bold = true }
          hl["@markup.heading.1.markdown"]         = { fg = "#67E8F9", bg = "none", bold = true }
          hl["@markup.heading.2.markdown"]         = { fg = "#14B8A6", bg = "none", bold = true }
          hl["@markup.heading.3.markdown"]         = { fg = "#F472B6", bg = "none", bold = true }
          hl["@markup.heading.4.markdown"]         = { fg = "#C283F5", bg = "none", bold = true }
          hl["@markup.heading.5.markdown"]         = { fg = "#FCD34D", bg = "none", bold = true }
          hl["@markup.heading.6.markdown"]         = { fg = "#F97316", bg = "none", bold = true }

          hl["@markup.link.label.markdown_inline"] = { fg = "#1a7d91", underline = true }
          hl["@markup.link.url.markdown_inline"]   = { fg = "#e0af68", underline = true }
          hl["@markup.list.markdown"]              = { fg = "#e9c46a", bg = "none", bold = false }
          hl["@markup.raw.block.markdown"]         = { fg = "#afb42b", bg = "none" }
          hl["@markup.raw.markdown_inline"]        = { fg = "#afb42b", bg = "none" }
          hl["@punctuation.special.markdown"]      = { fg = "#2a9d8f", bg = "none", bold = false }
        end,
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
      style = "moon",
    },
  },
}
