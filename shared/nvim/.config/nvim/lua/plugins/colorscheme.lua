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
          hl.CursorLine = { bg = "#24263a", }
          hl.CursorLineNr = { fg = "#e0af68", bg = "#24263a", }
          hl.SpellBad = { sp = "#f7768e", undercurl = true }
          hl.RenderMarkdownBullet = { fg = "#e0af68" }
          hl.RenderMarkdownTableHead = { fg = "#2a9d8f" }
          hl.RenderMarkdownTableRow = { fg = "#2a9d8f" }
          hl.RenderMarkdownCodeBorder = { bg = "none", fg = "#F97316" }
          hl.RenderMarkdownDash = { bg = "none", fg = "#afb42b" }

          -- vim.api.nvim_set_hl(0, "RenderMarkdownCodeBorder", { bg = "none", force = true })

          hl["@markup.heading.markdown"] = { bg = "none", bold = true, fg = "#8ab17d" }
          hl["@markup.heading.1.markdown"] = { bg = "none", bold = true, fg = "#14B8A6" }
          hl["@markup.heading.2.markdown"] = { bg = "none", bold = true, fg = "#67E8F9" }
          hl["@markup.heading.3.markdown"] = { bg = "none", bold = true, fg = "#C283F5" }
          hl["@markup.heading.4.markdown"] = { bg = "none", bold = true, fg = "#F472B6" }
          hl["@markup.heading.5.markdown"] = { bg = "none", bold = true, fg = "#F97316" }
          hl["@markup.heading.6.markdown"] = { bg = "none", bold = true, fg = "#FCD34D" }

          hl["@markup.link.label.markdown_inline"] = { underline = true, fg = "#1a7d91" }
          hl["@markup.link.url.markdown_inline"] = { underline = false, fg = "#e0af68" }

          hl["@markup.list.markdown"] = { bg = "none", bold = false, fg = "#e9c46a" }

          -- hl["@markup.raw.block.markdown"] = { fg = "#808080", bg = "none" }
          -- hl["@markup.raw.markdown_inline"] = { fg = "#808080", bg = "none" }

          hl["@punctuation.special.markdown"] = { bg = "none", bold = false, fg = "#2a9d8f" }
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
