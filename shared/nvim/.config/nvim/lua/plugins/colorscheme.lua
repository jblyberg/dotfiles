return {

  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      custom_highlights = function(C)
        return {
          CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
          CmpItemKindKeyword = { fg = C.base, bg = C.red },
          CmpItemKindText = { fg = C.base, bg = C.teal },
          CmpItemKindMethod = { fg = C.base, bg = C.blue },
          CmpItemKindConstructor = { fg = C.base, bg = C.blue },
          CmpItemKindFunction = { fg = C.base, bg = C.blue },
          CmpItemKindFolder = { fg = C.base, bg = C.blue },
          CmpItemKindModule = { fg = C.base, bg = C.blue },
          CmpItemKindConstant = { fg = C.base, bg = C.peach },
          CmpItemKindField = { fg = C.base, bg = C.green },
          CmpItemKindProperty = { fg = C.base, bg = C.green },
          CmpItemKindEnum = { fg = C.base, bg = C.green },
          CmpItemKindUnit = { fg = C.base, bg = C.green },
          CmpItemKindClass = { fg = C.base, bg = C.yellow },
          CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
          CmpItemKindFile = { fg = C.base, bg = C.blue },
          CmpItemKindInterface = { fg = C.base, bg = C.yellow },
          CmpItemKindColor = { fg = C.base, bg = C.red },
          CmpItemKindReference = { fg = C.base, bg = C.red },
          CmpItemKindEnumMember = { fg = C.base, bg = C.red },
          CmpItemKindStruct = { fg = C.base, bg = C.blue },
          CmpItemKindValue = { fg = C.base, bg = C.peach },
          CmpItemKindEvent = { fg = C.base, bg = C.blue },
          CmpItemKindOperator = { fg = C.base, bg = C.blue },
          CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
          CmpItemKindCopilot = { fg = C.base, bg = C.teal },
        }
      end,
    },
  },

  {
    "eldritch-theme/eldritch.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    "neanias/everforest-nvim",
    config = function()
      require("everforest").setup({
        background = "hard",
        transparent_background_level = 1,
      })
    end,
  },

  { "ellisonleao/gruvbox.nvim" },

  {
    "HoNamDuong/hybrid.nvim",
    config = function()
      require("hybrid").setup({
        terminal_colors = false,
        overrides = function(highlights, colors)
          local background = "#000000"

          highlights.Visual = { bg = background }
        end,
      })
    end,
  },

  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        transparent = true,
      })
    end,
  },

  { "rose-pine/neovim",        name = "rose-pine" },

  -- {
  --   "craftzdog/solarized-osaka.nvim",
  --   config = function()
  --     require("solarized-osaka").setup({
  --       transparent = false,
  --       on_highlights = function(highlights, colors)
  --         highlights.Visual = { bg = colors.base03, reverse = false }
  --       end,
  --     })
  --   end,
  -- },

  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        transparent = true,
        style = "moon",
        on_colors = function(colors)
          colors.hint = colors.orange
          colors.error = colors.red
          -- colors.bg = "#1c1d2c"
          -- colors.bg_statusline = colors.bg
        end,

        on_highlights = function(hl, colors)
          hl.CursorLine                            = { bg = "#24263a", }
          hl.CursorLineNr                          = { fg = "#e0af68", bg = "#24263a", }

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
          hl.MiniIconsExtGodot                     = { fg = "#cddc39" }
          hl.MiniIconsExtTscn                      = { fg = "#b73f73" }
          hl.MiniIconsExtGdUid                     = { fg = "#ffc777" }
          hl.MiniIconsExtImport                    = { fg = "#E072A4" }
          hl.MiniIconsExtMd                        = { fg = "#afb42b" }
          hl.MiniIconsExtP8                        = { fg = "#b73f73" }
          hl.MiniIconsExtPipe                      = { fg = "#558B6E" }
          hl.MiniIconsExtUid                       = { fg = "#B96AC9" }
          hl.MiniIconsFileReadmeMd                 = { fg = "#F97316" }

          hl["@markup.heading.markdown"]           = { fg = "#8ab17d", bg = "none", bold = true }
          hl["@markup.heading.1.markdown"]         = { fg = "#14B8A6", bg = "none", bold = true }
          hl["@markup.heading.2.markdown"]         = { fg = "#67E8F9", bg = "none", bold = true }
          hl["@markup.heading.3.markdown"]         = { fg = "#C283F5", bg = "none", bold = true }
          hl["@markup.heading.4.markdown"]         = { fg = "#F472B6", bg = "none", bold = true }
          hl["@markup.heading.5.markdown"]         = { fg = "#F97316", bg = "none", bold = true }
          hl["@markup.heading.6.markdown"]         = { fg = "#FCD34D", bg = "none", bold = true }

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

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
